@implementation CBProductInfo

+ (id)productInfoWithProductID:(unsigned int)a3
{
  CBProductInfo *v4;
  void *v5;
  CBProductInfo *v6;

  v4 = [CBProductInfo alloc];
  if ((int)a3 > 21759)
  {
    if ((int)a3 <= 28942)
    {
      switch(a3)
      {
        case 0x5500u:
          v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB389);
          return v6;
        case 0x6F04u:
          v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoJ42);
          return v6;
        case 0x7108u:
          v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoJ105);
          return v6;
      }
    }
    else if ((int)a3 > 29454)
    {
      if (a3 == 29455)
      {
        v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoJ305);
        return v6;
      }
      if (a3 == 29715)
      {
        v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB520);
        return v6;
      }
    }
    else
    {
      if (a3 == 28943)
      {
        v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB238A);
        return v6;
      }
      if (a3 == 28944)
      {
        v5 = &CBProductInfoB238;
LABEL_7:
        v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", v5);
        return v6;
      }
    }
LABEL_24:
    v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoInvalid);
    return v6;
  }
  switch(a3)
  {
    case 0x2002u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB188);
      break;
    case 0x2003u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB312);
      break;
    case 0x2004u:
    case 0x2007u:
    case 0x2008u:
    case 0x2015u:
    case 0x2018u:
    case 0x201Cu:
    case 0x2021u:
    case 0x2022u:
    case 0x2023u:
      goto LABEL_24;
    case 0x2005u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB282);
      break;
    case 0x2006u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB352);
      break;
    case 0x2009u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB443);
      break;
    case 0x200Au:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB515);
      break;
    case 0x200Bu:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB444);
      break;
    case 0x200Cu:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB419);
      break;
    case 0x200Du:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB364);
      break;
    case 0x200Eu:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB298);
      break;
    case 0x200Fu:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB288);
      break;
    case 0x2010u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB372);
      break;
    case 0x2011u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB507);
      break;
    case 0x2012u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB494);
      break;
    case 0x2013u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB688);
      break;
    case 0x2014u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB698);
      break;
    case 0x2016u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB607);
      break;
    case 0x2017u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB453);
      break;
    case 0x2019u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB768E);
      break;
    case 0x201Au:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB487);
      break;
    case 0x201Bu:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB768M);
      break;
    case 0x201Du:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB498);
      break;
    case 0x201Eu:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB768CHE);
      break;
    case 0x201Fu:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB515C);
      break;
    case 0x2020u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB768CHM);
      break;
    case 0x2024u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB698C);
      break;
    case 0x2025u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB465);
      break;
    case 0x2026u:
      v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB463);
      break;
    default:
      v5 = &CBProductInfoA111;
      switch(a3)
      {
        case 0x265u:
          v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoD67);
          break;
        case 0x267u:
          goto LABEL_7;
        case 0x269u:
          v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoA125);
          break;
        case 0x26Cu:
          v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoA211);
          break;
        case 0x29Au:
          v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoA222);
          break;
        case 0x29Cu:
          v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoA222e);
          break;
        case 0x29Fu:
          v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoA223);
          break;
        default:
          goto LABEL_24;
      }
      break;
  }
  return v6;
}

- (CBProductInfo)initWithProductInfoPtr:(id *)a3
{
  CBProductInfo *v4;
  CBProductInfo *v5;
  CBProductInfo *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CBProductInfo;
  v4 = -[CBProductInfo init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_flags = a3->var0;
    objc_storeStrong((id *)&v4->_model, a3->var1);
    v5->_productID = a3->var2;
    objc_storeStrong((id *)&v5->_productName, a3->var3);
    v5->_radarComponentID = a3->var4;
    objc_storeStrong((id *)&v5->_sfSymbolNameCase, a3->var5);
    objc_storeStrong((id *)&v5->_sfSymbolNameMain, a3->var6);
    v5->_vendorIDBluetooth = a3->var7;
    v5->_vendorIDUSB = a3->var8;
    v6 = v5;
  }

  return v5;
}

- (unsigned)flags
{
  return self->_flags;
}

- (NSString)model
{
  return self->_model;
}

- (unsigned)productID
{
  return self->_productID;
}

- (NSString)productName
{
  return self->_productName;
}

- (unsigned)radarComponentID
{
  return self->_radarComponentID;
}

- (NSString)sfSymbolNameCase
{
  return self->_sfSymbolNameCase;
}

- (NSString)sfSymbolNameMain
{
  return self->_sfSymbolNameMain;
}

- (unsigned)vendorIDBluetooth
{
  return self->_vendorIDBluetooth;
}

- (unsigned)vendorIDUSB
{
  return self->_vendorIDUSB;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfSymbolNameMain, 0);
  objc_storeStrong((id *)&self->_sfSymbolNameCase, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
