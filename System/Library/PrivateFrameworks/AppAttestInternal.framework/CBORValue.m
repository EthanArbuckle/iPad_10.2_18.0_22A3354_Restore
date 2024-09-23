@implementation CBORValue

- (int)fieldType
{
  return -1;
}

- (unsigned)fieldValue
{
  return 32 * (-[CBORValue fieldType](self, "fieldType") & 7);
}

- (void)write:(id)a3
{
  -[CBORValue encodeStartItems:output:](self, "encodeStartItems:output:", 0, a3);
}

- (void)encodeStartItems:(unint64_t)a3 output:(id)a4
{
  id v6;

  v6 = a4;
  -[CBORValue setUint:item2:output:](self, "setUint:item2:output:", -[CBORValue fieldValue](self, "fieldValue"), a3, v6);

}

- (void)setAdditionalInformation:(unsigned __int8)a3 item2:(unsigned __int8)a4 output:(id)a5
{
  char v5;

  v5 = a4 & 0x1F | a3;
  objc_msgSend(a5, "appendBytes:length:", &v5, 1);
}

- (void)setUint:(unsigned __int8)a3 item2:(unint64_t)a4 output:(id)a5
{
  uint64_t v6;
  id v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  char v12;
  int v13;
  BOOL v14;
  char v15;

  v6 = a3;
  v8 = a5;
  v9 = -[CBORValue getNumUintBytes:](self, "getNumUintBytes:", a4);
  v10 = 0;
  v11 = 24;
  switch(v9)
  {
    case 0uLL:
      -[CBORValue setAdditionalInformation:item2:output:](self, "setAdditionalInformation:item2:output:", v6, a4, v8);
      break;
    case 1uLL:
      goto LABEL_6;
    case 2uLL:
      v11 = 25;
      v10 = 1;
      goto LABEL_6;
    case 4uLL:
      v11 = 26;
      v10 = 3;
      goto LABEL_6;
    case 8uLL:
      v11 = 27;
      v10 = 7;
LABEL_6:
      -[CBORValue setAdditionalInformation:item2:output:](self, "setAdditionalInformation:item2:output:", v6, v11, v8);
      v12 = 8 * v10;
      v13 = v10 + 1;
      do
      {
        v15 = a4 >> (v12 & 0xF8);
        objc_msgSend(v8, "appendBytes:length:", &v15, 1);
        v12 -= 8;
        v14 = __OFSUB__(v13--, 1);
      }
      while (!((v13 < 0) ^ v14 | (v13 == 0)));
      break;
    default:
      break;
  }

}

- (unint64_t)getNumUintBytes:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = 1;
  v4 = 2;
  v5 = 8;
  if (!HIDWORD(a3))
    v5 = 4;
  if (a3 >= 0x10000)
    v4 = v5;
  if (a3 >= 0x100)
    v3 = v4;
  if (a3 >= 0x18)
    return v3;
  else
    return 0;
}

@end
