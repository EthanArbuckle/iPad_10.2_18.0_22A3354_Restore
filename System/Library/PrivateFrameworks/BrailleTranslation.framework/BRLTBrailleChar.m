@implementation BRLTBrailleChar

- (BRLTBrailleChar)initWithBits:(unsigned __int8)a3
{
  BRLTBrailleChar *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRLTBrailleChar;
  result = -[BRLTBrailleChar init](&v5, sel_init);
  result->_bits = a3;
  return result;
}

- (BRLTBrailleChar)initWithUnicode:(id)a3
{
  return -[BRLTBrailleChar initWithUnichar:](self, "initWithUnichar:", objc_msgSend(a3, "characterAtIndex:", 0));
}

- (BRLTBrailleChar)initWithUnichar:(unsigned __int16)a3
{
  return -[BRLTBrailleChar initWithBits:](self, "initWithBits:", a3);
}

- (BRLTBrailleChar)initWithBrf:(id)a3
{
  void *v4;
  BRLTBrailleChar *v5;

  +[BRLTBrailleString brfToUnicode:](BRLTBrailleString, "brfToUnicode:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BRLTBrailleChar initWithUnicode:](self, "initWithUnicode:", v4);

  return v5;
}

+ (id)charWithBits:(unsigned __int8)a3
{
  return -[BRLTBrailleChar initWithBits:]([BRLTBrailleChar alloc], "initWithBits:", a3);
}

+ (id)charWithUnicode:(id)a3
{
  id v3;
  BRLTBrailleChar *v4;

  v3 = a3;
  v4 = -[BRLTBrailleChar initWithUnicode:]([BRLTBrailleChar alloc], "initWithUnicode:", v3);

  return v4;
}

+ (id)charWithUnichar:(unsigned __int16)a3
{
  return -[BRLTBrailleChar initWithUnichar:]([BRLTBrailleChar alloc], "initWithUnichar:", a3);
}

+ (id)charWithBrf:(id)a3
{
  id v3;
  BRLTBrailleChar *v4;

  v3 = a3;
  v4 = -[BRLTBrailleChar initWithBrf:]([BRLTBrailleChar alloc], "initWithBrf:", v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BRLTBrailleChar initWithBits:](+[BRLTBrailleChar allocWithZone:](BRLTBrailleChar, "allocWithZone:", a3), "initWithBits:", self->_bits);
}

- (NSString)unicode
{
  __int16 v3;

  v3 = self->_bits | 0x2800;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v3, 1);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)bits
{
  return self->_bits;
}

- (void)setDot1:(BOOL)a3
{
  -[BRLTBrailleChar _setDot:up:](self, "_setDot:up:", 1, a3);
}

- (BOOL)dot1
{
  return -[BRLTBrailleChar _dotUp:](self, "_dotUp:", 1);
}

- (void)setDot2:(BOOL)a3
{
  -[BRLTBrailleChar _setDot:up:](self, "_setDot:up:", 2, a3);
}

- (BOOL)dot2
{
  return -[BRLTBrailleChar _dotUp:](self, "_dotUp:", 2);
}

- (void)setDot3:(BOOL)a3
{
  -[BRLTBrailleChar _setDot:up:](self, "_setDot:up:", 3, a3);
}

- (BOOL)dot3
{
  return -[BRLTBrailleChar _dotUp:](self, "_dotUp:", 3);
}

- (void)setDot4:(BOOL)a3
{
  -[BRLTBrailleChar _setDot:up:](self, "_setDot:up:", 4, a3);
}

- (BOOL)dot4
{
  return -[BRLTBrailleChar _dotUp:](self, "_dotUp:", 4);
}

- (void)setDot5:(BOOL)a3
{
  -[BRLTBrailleChar _setDot:up:](self, "_setDot:up:", 5, a3);
}

- (BOOL)dot5
{
  return -[BRLTBrailleChar _dotUp:](self, "_dotUp:", 5);
}

- (void)setDot6:(BOOL)a3
{
  -[BRLTBrailleChar _setDot:up:](self, "_setDot:up:", 6, a3);
}

- (BOOL)dot6
{
  return -[BRLTBrailleChar _dotUp:](self, "_dotUp:", 6);
}

- (void)setDot7:(BOOL)a3
{
  -[BRLTBrailleChar _setDot:up:](self, "_setDot:up:", 7, a3);
}

- (BOOL)dot7
{
  return -[BRLTBrailleChar _dotUp:](self, "_dotUp:", 7);
}

- (void)setDot8:(BOOL)a3
{
  -[BRLTBrailleChar _setDot:up:](self, "_setDot:up:", 8, a3);
}

- (BOOL)dot8
{
  return -[BRLTBrailleChar _dotUp:](self, "_dotUp:", 8);
}

- (void)_setDot:(int)a3 up:(BOOL)a4
{
  int v4;
  unsigned __int8 bits;
  unsigned __int8 v6;
  unsigned __int8 v7;

  v4 = 1 << (a3 - 1);
  bits = self->_bits;
  v6 = bits & ~(_BYTE)v4;
  v7 = bits | v4;
  if (!a4)
    v7 = v6;
  self->_bits = v7;
}

- (BOOL)_dotUp:(int)a3
{
  return (self->_bits >> (a3 - 1)) & 1;
}

- (BOOL)isEqualToBrailleChar:(id)a3
{
  int bits;

  bits = self->_bits;
  return bits == objc_msgSend(a3, "bits");
}

- (BOOL)isEqual:(id)a3
{
  BRLTBrailleChar *v4;
  BOOL v5;

  v4 = (BRLTBrailleChar *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[BRLTBrailleChar isEqualToBrailleChar:](self, "isEqualToBrailleChar:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_bits;
}

- (id)description
{
  void *v2;
  void *v3;

  -[BRLTBrailleChar unicode](self, "unicode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRLTBrailleString unicodeToBestEffortBrf:](BRLTBrailleString, "unicodeToBestEffortBrf:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
