@implementation NSEncodingDetector

- (void)reset
{
  *(_WORD *)&self->_hasBase64 = 0;
  self->_hasBOM = 0;
  *(_OWORD *)&self->_givenNumBytes = 0u;
  *(_OWORD *)&self->_numMultiByteChars = 0u;
  *(_OWORD *)&self->_skipBytes = 0u;
  *(_OWORD *)&self->_mostFrqChars = 0u;
  *(_OWORD *)&self->_numRep = 0u;
  *(_OWORD *)&self->_numBase64 = 0u;
  *(_OWORD *)&self->_numTrigram = 0u;
  self->_numHigher = 0;
  self->_weight = 1.0;
  self->_tag = 0;
}

- (void)softReset
{
  double weight;
  unsigned int tag;

  weight = self->_weight;
  tag = self->_tag;
  -[NSEncodingDetector reset](self, "reset");
  self->_tag = tag;
  self->_weight = weight;
}

- (double)bytesRatio
{
  unint64_t givenNumBytes;
  double result;
  unint64_t v4;

  givenNumBytes = self->_givenNumBytes;
  result = 0.0;
  v4 = givenNumBytes - self->_skipBytes;
  if (v4)
    return (double)v4 / (double)givenNumBytes;
  return result;
}

- (unint64_t)maxSkipBytes
{
  return (unint64_t)((double)self->_givenNumBytes * 0.15);
}

- (NSEncodingDetector)initWithNSStringEncoding:(unint64_t)a3 CFStringEncoding:(unsigned int)a4 recognizeFunc:(void *)a5
{
  NSEncodingDetector *v8;
  NSEncodingDetector *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)NSEncodingDetector;
  v8 = -[NSEncodingDetector init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_recognizeFunc = a5;
    v8->_nsEncoding = a3;
    v8->_cfEncoding = a4;
    -[NSEncodingDetector reset](v8, "reset");
  }
  return v9;
}

- (double)confidence
{
  signed int cfEncoding;
  unsigned int v3;
  double result;
  unint64_t skipBytes;
  double v7;
  unint64_t numChars;
  unint64_t v9;

  cfEncoding = self->_cfEncoding;
  if (cfEncoding > 1052)
  {
    if ((cfEncoding - 1280) < 9 || cfEncoding == 1053)
    {
LABEL_9:
      -[NSEncodingDetector _singleByte_confidence](self, "_singleByte_confidence");
      return result;
    }
    if (cfEncoding == 1536)
    {
      -[NSEncodingDetector _ASCII_confidence](self, "_ASCII_confidence");
      return result;
    }
  }
  else
  {
    v3 = cfEncoding - 513;
    if (v3 <= 0xF && v3 != 11)
      goto LABEL_9;
  }
  skipBytes = self->_skipBytes;
  if (skipBytes)
    v7 = 1.0 / (double)(skipBytes + 1);
  else
    v7 = 1.0;
  numChars = self->_numChars;
  if (!numChars)
    return 0.0;
  v9 = self->_numBigrams + self->_mostFrqChars + 1;
  return self->_weight
       * (v7
        * v7
        * ((double)v9
         / (double)numChars
         * (double)v9
         / (double)(self->_numMultiByteChars + 1)));
}

- (double)confidenceWith2Chars
{
  unint64_t skipBytes;
  double v3;
  unint64_t numChars;

  skipBytes = self->_skipBytes;
  if (skipBytes)
    v3 = 1.0 / (double)(skipBytes + 1);
  else
    v3 = 1.0;
  numChars = self->_numChars;
  if (numChars)
    return v3 * ((double)self->_mostFrqChars / (double)numChars * (double)self->_numBigrams);
  else
    return 0.0;
}

- (double)_ASCII_confidence
{
  double v2;

  v2 = (double)self->_numChars / (double)self->_givenNumBytes;
  return self->_weight * (v2 * exp2((double)self->_skipBytes * -10.0 + (double)self->_skipBytes * -10.0));
}

- (double)_singleByte_confidence
{
  unint64_t skipBytes;
  double v3;
  unint64_t numChars;
  unint64_t v5;

  skipBytes = self->_skipBytes;
  if (skipBytes)
    v3 = 1.0 / (double)(skipBytes + 1);
  else
    v3 = 1.0;
  numChars = self->_numChars;
  if (!numChars)
    return 0.0;
  v5 = self->_numTrigram + self->_mostFrqChars + 1;
  return self->_weight * (v3 * v3 * ((double)v5 / (double)numChars * (double)v5 / (double)(self->_numHigher + 1)));
}

- (double)multiBytesRatio
{
  unint64_t numMultiByteChars;
  double result;
  unint64_t numChars;

  numMultiByteChars = self->_numMultiByteChars;
  result = 0.0;
  if (numMultiByteChars)
  {
    numChars = self->_numChars;
    if (numChars)
      return (double)numMultiByteChars
           / (double)numChars
           * (double)(self->_givenNumBytes - self->_skipBytes)
           / (double)self->_givenNumBytes;
  }
  return result;
}

+ (id)detectorForCFStringEncoding:(unsigned int)a3 allowBackupDetectors:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, unint64_t, void *);
  NSEncodingDetector *v8;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v6 = objc_msgSend(a1, "recognizeFuncForCFStringEncoding:");
  v7 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void *))v6;
  if (v6 || !v4)
  {
    if (v6)
      goto LABEL_6;
LABEL_7:
    v8 = 0;
    return v8;
  }
  if ((_DWORD)v5 != 2561)
    goto LABEL_7;
  v7 = _SHIFTJISX0213_recognize;
LABEL_6:
  v8 = -[NSEncodingDetector initWithNSStringEncoding:CFStringEncoding:recognizeFunc:]([NSEncodingDetector alloc], "initWithNSStringEncoding:CFStringEncoding:recognizeFunc:", CFStringConvertEncodingToNSStringEncoding(v5), v5, v7);
  return v8;
}

- (unint64_t)recognizeString:(const char *)a3 withDataLength:(unint64_t)a4 intoBuffer:(id)a5
{
  return ((uint64_t (*)(NSEncodingDetector *, const char *, unint64_t, id))self->_recognizeFunc)(self, a3, a4, a5);
}

+ (void)recognizeFuncForCFStringEncoding:(unsigned int)a3
{
  void *result;

  result = _ASCII_recognize;
  if ((int)a3 <= 1535)
  {
    if ((int)a3 > 1052)
    {
      switch(a3)
      {
        case 0x500u:
          result = _WINDOWS1252_recognize;
          break;
        case 0x501u:
          result = _WINDOWS1250_recognize;
          break;
        case 0x502u:
          result = _WINDOWS1251_recognize;
          break;
        case 0x503u:
          result = _WINDOWS1253_recognize;
          break;
        case 0x504u:
          result = _WINDOWS1254_recognize;
          break;
        case 0x505u:
          result = _WINDOWS1255_recognize;
          break;
        case 0x506u:
          result = _WINDOWS1256_recognize;
          break;
        case 0x507u:
          result = _WINDOWS1257_recognize;
          break;
        case 0x508u:
          result = _WINDOWS1258_recognize;
          break;
        default:
          switch(a3)
          {
            case 0x41Du:
              result = _WINDOWS874_recognize;
              break;
            case 0x420u:
              result = _WINDOWS932_recognize;
              break;
            case 0x421u:
              result = _WINDOWS936_recognize;
              break;
            case 0x422u:
              result = _WINDOWS949_recognize;
              break;
            case 0x423u:
              result = _WINDOWS950_recognize;
              break;
            default:
              return 0;
          }
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x201u:
          return _ISOLATIN1_recognize;
        case 0x202u:
          return _ISOLATIN2_recognize;
        case 0x203u:
          return _ISOLATIN3_recognize;
        case 0x204u:
          return _ISOLATIN4_recognize;
        case 0x205u:
          return _ISO88595_recognize;
        case 0x206u:
          return _ISO88596_recognize;
        case 0x207u:
          return _ISO88597_recognize;
        case 0x208u:
          return _ISO88598_recognize;
        case 0x209u:
          return _ISOLATIN5_recognize;
        case 0x20Au:
          return _ISOLATIN6_recognize;
        case 0x20Bu:
          return _ISO885911_recognize;
        case 0x20Cu:
          return 0;
        case 0x20Du:
          return _ISOLATIN7_recognize;
        case 0x20Eu:
          return _ISOLATIN8_recognize;
        case 0x20Fu:
          return _ISOLATIN9_recognize;
        case 0x210u:
          return _ISOLATIN10_recognize;
        default:
          if (!a3)
            return result;
          if (a3 != 256)
            return 0;
          result = _UTF16_recognize;
          break;
      }
    }
    return result;
  }
  if ((int)a3 <= 2367)
  {
    if ((int)a3 > 2081)
    {
      if ((int)a3 > 2335)
      {
        switch(a3)
        {
          case 0x920u:
            return _EUCJP_recognize;
          case 0x930u:
            return _EUCGB2312_recognize;
          case 0x931u:
            return _EUCTW_recognize;
        }
      }
      else
      {
        switch(a3)
        {
          case 0x822u:
            return _ISO2022JP1_recognize;
          case 0x830u:
            return _ISO2022CN_recognize;
          case 0x840u:
            return _ISO2022KR_recognize;
        }
      }
    }
    else if ((int)a3 > 1585)
    {
      switch(a3)
      {
        case 0x632u:
          return _GB18030_recognize;
        case 0x820u:
          return _ISO2022JP_recognize;
        case 0x821u:
          return _ISO2022JP2_recognize;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x600u:
          return result;
        case 0x628u:
          return _SHIFTJISX0213_recognize;
        case 0x631u:
          return _GBK_recognize;
      }
    }
    return 0;
  }
  if ((int)a3 > 134217983)
  {
    if ((int)a3 > 335544575)
    {
      switch(a3)
      {
        case 0x14000100u:
          return _UTF16LE_recognize;
        case 0x18000100u:
          return _UTF32BE_recognize;
        case 0x1C000100u:
          return _UTF32LE_recognize;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x8000100u:
          return _UTF8_recognize;
        case 0xC000100u:
          return _UTF32_recognize;
        case 0x10000100u:
          return _UTF16BE_recognize;
      }
    }
    return 0;
  }
  switch(a3)
  {
    case 0xA03u:
      return _Big5_recognize;
    case 0xA04u:
    case 0xA07u:
    case 0xA08u:
      return 0;
    case 0xA05u:
      return _HZGB2312_recognize;
    case 0xA06u:
      return _Big5HKSCS_recognize;
    case 0xA09u:
      return _BigE_recognize;
    default:
      if (a3 == 2368)
      {
        result = _EUCKR_recognize;
      }
      else
      {
        if (a3 != 67109120)
          return 0;
        result = _UTF7_recognize;
      }
      break;
  }
  return result;
}

- (unint64_t)nsEncoding
{
  return self->_nsEncoding;
}

- (unsigned)cfEncoding
{
  return self->_cfEncoding;
}

@end
