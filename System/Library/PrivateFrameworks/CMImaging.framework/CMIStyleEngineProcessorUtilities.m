@implementation CMIStyleEngineProcessorUtilities

+ (BOOL)isPixelBufferYUV420:(__CVBuffer *)a3
{
  signed int PixelFormatType;
  BOOL result;
  int v5;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  result = 1;
  if (PixelFormatType <= 875704421)
  {
    if (PixelFormatType > 762865199)
    {
      if (PixelFormatType > 792229423)
      {
        if (PixelFormatType != 792229424 && PixelFormatType != 796419632)
        {
          v5 = 796423728;
          goto LABEL_34;
        }
      }
      else if (PixelFormatType != 762865200 && PixelFormatType != 762869296)
      {
        v5 = 792225328;
        goto LABEL_34;
      }
    }
    else if (PixelFormatType > 645428783)
    {
      if (PixelFormatType != 645428784 && PixelFormatType != 758670896)
      {
        v5 = 758674992;
        goto LABEL_34;
      }
    }
    else if (PixelFormatType != 641230384 && PixelFormatType != 641234480)
    {
      v5 = 645424688;
      goto LABEL_34;
    }
  }
  else if (PixelFormatType <= 2016686639)
  {
    if (PixelFormatType > 1882468911)
    {
      if (PixelFormatType != 1882468912 && PixelFormatType != 1885745712)
      {
        v5 = 1886859824;
        goto LABEL_34;
      }
    }
    else if (PixelFormatType != 875704422 && PixelFormatType != 875704438)
    {
      v5 = 1751527984;
      goto LABEL_34;
    }
  }
  else
  {
    if (PixelFormatType > 2084070959)
    {
      if (PixelFormatType > 2088265263)
      {
        if (PixelFormatType == 2088265264)
          return result;
        v5 = 2088269360;
      }
      else
      {
        if (PixelFormatType == 2084070960)
          return result;
        v5 = 2084075056;
      }
      goto LABEL_34;
    }
    if (PixelFormatType != 2016686640 && PixelFormatType != 2019963440)
    {
      v5 = 2021077552;
LABEL_34:
      if (PixelFormatType != v5)
        return 0;
    }
  }
  return result;
}

+ ($7DEDF3842AEFB7F1E6DF5AF62E424A02)getMTLPixelFormatsForDualPlaneYUV420CVPixelBuffer:(__CVBuffer *)a3
{
  signed int PixelFormatType;
  unint64_t v4;
  unint64_t v5;
  int v6;
  int v7;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v4 = 30;
  v5 = 10;
  if (PixelFormatType <= 875704421)
  {
    if (PixelFormatType > 762865199)
    {
      if (PixelFormatType > 792229423)
      {
        if (PixelFormatType == 792229424)
          goto LABEL_42;
        if (PixelFormatType != 796419632)
        {
          v7 = 796423728;
          goto LABEL_38;
        }
        goto LABEL_39;
      }
      if (PixelFormatType == 762865200 || PixelFormatType == 762869296)
        goto LABEL_39;
      v6 = 792225328;
    }
    else
    {
      if (PixelFormatType <= 645428783)
      {
        if (PixelFormatType != 641230384 && PixelFormatType != 641234480)
        {
          v7 = 645424688;
          goto LABEL_38;
        }
        goto LABEL_42;
      }
      if (PixelFormatType == 645428784)
        goto LABEL_39;
      if (PixelFormatType == 758670896)
        goto LABEL_42;
      v6 = 758674992;
    }
LABEL_28:
    if (PixelFormatType == v6)
      goto LABEL_42;
    goto LABEL_41;
  }
  if (PixelFormatType <= 2016686639)
  {
    if (PixelFormatType > 1882468911)
    {
      if (PixelFormatType == 1882468912 || PixelFormatType == 1885745712)
        goto LABEL_39;
      v7 = 1886859824;
LABEL_38:
      if (PixelFormatType == v7)
        goto LABEL_39;
LABEL_41:
      v5 = 0;
      v4 = 0;
      goto LABEL_42;
    }
    if (PixelFormatType != 875704422 && PixelFormatType != 875704438)
    {
      if (PixelFormatType != 1751527984)
        goto LABEL_41;
      v4 = 65;
      v5 = 25;
    }
  }
  else
  {
    if (PixelFormatType > 2084070959)
    {
      if (PixelFormatType <= 2088265263)
      {
        if (PixelFormatType == 2084070960)
          goto LABEL_42;
        v6 = 2084075056;
        goto LABEL_28;
      }
      if (PixelFormatType != 2088265264)
      {
        v7 = 2088269360;
        goto LABEL_38;
      }
LABEL_39:
      v4 = 589;
      v5 = 588;
      goto LABEL_42;
    }
    if (PixelFormatType != 2016686640 && PixelFormatType != 2019963440 && PixelFormatType != 2021077552)
      goto LABEL_41;
    v4 = 578;
    v5 = 576;
  }
LABEL_42:
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

+ (unint64_t)getMTLPixelFormatForCVPixelBuffer:(__CVBuffer *)a3 plane:(unsigned int)a4
{
  signed int PixelFormatType;
  unint64_t v6;
  unsigned __int16 v7;
  int v8;
  int v9;
  int v10;
  unsigned __int16 v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unsigned __int16 v18;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v6 = 500;
  if (PixelFormatType > 875836517)
  {
    if (PixelFormatType > 1886859825)
    {
      if (PixelFormatType <= 2021078067)
      {
        if (PixelFormatType <= 2019963439)
        {
          if (PixelFormatType > 2016686639)
          {
            if (PixelFormatType != 2016686640)
            {
              if (PixelFormatType != 2016686642)
              {
                if (PixelFormatType != 2016687156)
                  return 0;
                return 507;
              }
              return 506;
            }
            return 505;
          }
          if (PixelFormatType != 1886859826)
          {
            if (PixelFormatType != 1886860340)
              return 0;
            return 510;
          }
          return 509;
        }
        if (PixelFormatType <= 2019963955)
        {
          if (PixelFormatType == 2019963440)
            return 505;
          v12 = 2019963442;
LABEL_112:
          if (PixelFormatType == v12)
            return 506;
          return 0;
        }
        if (PixelFormatType != 2019963956)
        {
          if (PixelFormatType == 2021077552)
            return 505;
          v12 = 2021077554;
          goto LABEL_112;
        }
        return 507;
      }
      if (PixelFormatType <= 2085775424)
      {
        if (PixelFormatType > 2084070959)
        {
          if (PixelFormatType != 2084070960 && PixelFormatType != 2084075056)
          {
            v9 = 2084718401;
            goto LABEL_49;
          }
          return v6;
        }
        if (PixelFormatType == 2021078068)
          return 507;
        v17 = 2037741158;
        goto LABEL_117;
      }
      if (PixelFormatType > 2088265265)
      {
        if (PixelFormatType == 2088265266)
          return 509;
        if (PixelFormatType != 2088269360)
        {
          v8 = 2088269362;
          goto LABEL_144;
        }
        return 508;
      }
      if (PixelFormatType != 2085775425)
      {
        v14 = 2088265264;
LABEL_129:
        if (PixelFormatType != v14)
          return 0;
        return 508;
      }
      return 115;
    }
    if (PixelFormatType > 1751527985)
    {
      if (PixelFormatType <= 1882469427)
      {
        if (PixelFormatType > 1815491697)
        {
          if (PixelFormatType == 1815491698)
            return 110;
          if (PixelFormatType != 1882468912)
          {
            v8 = 1882468914;
            goto LABEL_144;
          }
          return 508;
        }
        if (PixelFormatType == 1751527986)
        {
LABEL_91:
          v6 = 65;
          if (a4 != 1)
            v6 = 0;
          if (!a4)
            return 25;
          return v6;
        }
        v11 = 13364;
LABEL_90:
        if (PixelFormatType != (v11 | 0x68660000))
          return 0;
        goto LABEL_91;
      }
      if (PixelFormatType <= 1885745713)
      {
        if (PixelFormatType != 1882469428)
        {
          v14 = 1885745712;
          goto LABEL_129;
        }
      }
      else
      {
        if (PixelFormatType == 1885745714)
          return 509;
        if (PixelFormatType != 1885746228)
        {
          v14 = 1886859824;
          goto LABEL_129;
        }
      }
      return 510;
    }
    if (PixelFormatType > 1278226535)
    {
      if (PixelFormatType <= 1380410944)
      {
        if (PixelFormatType == 1278226536)
          return 25;
        if (PixelFormatType == 1380401729)
          return 70;
        return 0;
      }
      if (PixelFormatType == 1380410945)
        return 125;
      if (PixelFormatType == 1380411457)
        return 115;
      v11 = 12848;
      goto LABEL_90;
    }
    if (PixelFormatType <= 1111970368)
    {
      if (PixelFormatType == 875836518)
        return 503;
      v16 = 875836534;
      goto LABEL_134;
    }
    if (PixelFormatType != 1111970369)
    {
      if (PixelFormatType == 1278226534)
        return 55;
      return 0;
    }
    return 80;
  }
  if (PixelFormatType <= 759318336)
  {
    if (PixelFormatType > 645424687)
    {
      if (PixelFormatType <= 645428787)
      {
        if (PixelFormatType <= 645424691)
        {
          if (PixelFormatType == 645424688)
            return 508;
          v7 = 26162;
        }
        else
        {
          if (PixelFormatType == 645424692)
            return 510;
          if (PixelFormatType == 645428784)
            return 508;
          v7 = 30258;
        }
        v8 = v7 | 0x26780000;
LABEL_144:
        if (PixelFormatType == v8)
          return 509;
        return 0;
      }
      if (PixelFormatType <= 645494130)
      {
        if (PixelFormatType != 645428788)
        {
          v17 = 645494118;
LABEL_117:
          if (PixelFormatType != v17)
            return 0;
          return 501;
        }
        return 510;
      }
      if (PixelFormatType != 645494131)
      {
        if (PixelFormatType == 758670896)
          return v6;
        v13 = 758674992;
        goto LABEL_124;
      }
      return 501;
    }
    if (PixelFormatType > 641234479)
    {
      if (PixelFormatType > 641234483)
      {
        if (PixelFormatType == 641234484)
          return 503;
        if (PixelFormatType == 641877825)
          return 80;
        v10 = 642934849;
LABEL_80:
        if (PixelFormatType != v10)
          return 0;
        return 115;
      }
      if (PixelFormatType == 641234480)
        return v6;
      v15 = 641234482;
      goto LABEL_103;
    }
    if (PixelFormatType <= 641230385)
    {
      if (PixelFormatType == 32)
        return 84;
      v13 = 641230384;
      goto LABEL_124;
    }
    if (PixelFormatType != 641230386)
    {
      v16 = 641230388;
LABEL_134:
      if (PixelFormatType != v16)
        return 0;
      return 503;
    }
    return 502;
  }
  if (PixelFormatType > 793929792)
  {
    if (PixelFormatType <= 846624120)
    {
      if (PixelFormatType > 796419633)
      {
        if (PixelFormatType == 796419634)
          return 509;
        if (PixelFormatType != 796423728)
        {
          v8 = 796423730;
          goto LABEL_144;
        }
        return 508;
      }
      if (PixelFormatType != 793929793)
      {
        v14 = 796419632;
        goto LABEL_129;
      }
      return 115;
    }
    if (PixelFormatType <= 875704437)
    {
      if (PixelFormatType == 846624121)
        return 501;
      v13 = 875704422;
LABEL_124:
      if (PixelFormatType != v13)
        return 0;
      return v6;
    }
    if (PixelFormatType == 875704438)
      return v6;
    if (PixelFormatType != 875704934)
    {
      v15 = 875704950;
LABEL_103:
      if (PixelFormatType != v15)
        return 0;
    }
    return 502;
  }
  if (PixelFormatType <= 762869295)
  {
    if (PixelFormatType <= 762865199)
    {
      if (PixelFormatType == 759318337)
        return 80;
      v10 = 760375361;
      goto LABEL_80;
    }
    if (PixelFormatType == 762865200)
      return 508;
    v18 = 26162;
LABEL_143:
    v8 = v18 | 0x2D780000;
    goto LABEL_144;
  }
  if (PixelFormatType <= 792225327)
  {
    if (PixelFormatType == 762869296)
      return 508;
    v18 = 30258;
    goto LABEL_143;
  }
  if (PixelFormatType != 792225328 && PixelFormatType != 792229424)
  {
    v9 = 792872769;
LABEL_49:
    if (PixelFormatType != v9)
      return 0;
    return 80;
  }
  return v6;
}

+ (unsigned)numberOfPixelBufferPlanesThatNeedToBeBoundToMTLTextures:(__CVBuffer *)a3
{
  unint64_t v4;
  OSType PixelFormatType;

  v4 = +[CMIStyleEngineProcessorUtilities getMTLPixelFormatForCVPixelBuffer:plane:](CMIStyleEngineProcessorUtilities, "getMTLPixelFormatForCVPixelBuffer:plane:", a3, 0);
  if (v4)
  {
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    if (PixelFormatType == 1751527984 || PixelFormatType == 1751528500 || PixelFormatType == 1751527986)
      LODWORD(v4) = CVPixelBufferGetPlaneCount(a3);
    else
      LODWORD(v4) = 1;
  }
  return v4;
}

+ (BOOL)textureIsLinearSRGB:(id)a3
{
  id v3;
  void *v4;
  __int16 v6;

  v3 = a3;
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pixelFormat");

  MTLPixelFormatGetInfoForDevice();
  return (v6 & 0x800) != 0;
}

@end
