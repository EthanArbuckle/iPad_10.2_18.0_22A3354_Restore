@implementation AXOutputAction

+ (unint64_t)newOutputActionID
{
  uint64_t v2;

  v2 = arc4random();
  return arc4random() | (unint64_t)(v2 << 32);
}

- (AXOutputAction)initWithAXAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AXOutputAction *v7;
  void *v8;
  uint64_t v9;
  AXIndexMap *variants;

  v4 = a3;
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "brailleString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AXOutputAction initWithString:brailleString:](self, "initWithString:brailleString:", v5, v6);

  if (v7)
  {
    objc_msgSend(v4, "outputVariants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    variants = v7->_variants;
    v7->_variants = (AXIndexMap *)v9;

    v7->_performPunctuationTranslation = objc_msgSend(v4, "performPunctuationTranslation");
    v7->_replaceCommas = objc_msgSend(v4, "replaceCommas");
    v7->_outputActionID = objc_msgSend(v4, "outputActionID");
  }

  return v7;
}

- (AXOutputAction)initWithString:(id)a3
{
  return -[AXOutputAction initWithString:brailleString:](self, "initWithString:brailleString:", a3, 0);
}

- (AXOutputAction)initWithString:(id)a3 brailleString:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  NSString *originalString;
  NSString *v10;
  NSString *brailleString;
  NSString *v12;
  NSString *string;

  if (self)
  {
    v6 = a4;
    v7 = a3;
    v8 = (NSString *)objc_msgSend(v7, "copy");
    originalString = self->_originalString;
    self->_originalString = v8;

    v10 = (NSString *)objc_msgSend(v6, "copy");
    brailleString = self->_brailleString;
    self->_brailleString = v10;

    v12 = (NSString *)objc_msgSend(v7, "copy");
    string = self->_string;
    self->_string = v12;

    self->_replaceCommas = 1;
    *(_WORD *)&self->_generatesBraille = 1;
    self->_outputActionID = +[AXOutputAction newOutputActionID](AXOutputAction, "newOutputActionID");
  }
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSString copy](self->_string, "copy");
  v6 = (void *)v4[3];
  v4[3] = v5;

  v7 = -[NSString copy](self->_originalString, "copy");
  v8 = (void *)v4[5];
  v4[5] = v7;

  v9 = -[AXIndexMap copy](self->_variants, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

  v4[6] = self->_outputActionID;
  *((_BYTE *)v4 + 8) = self->_generatesBraille;
  return v4;
}

- (_NSRange)_rangeOfString
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[NSString rangeOfString:](self->_originalString, "rangeOfString:", self->_string);
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setString:(id)a3 overrideOriginalString:(BOOL)a4
{
  _BOOL4 v4;
  NSString *v6;
  NSString *originalString;

  v4 = a4;
  -[AXOutputAction setString:](self, "setString:", a3);
  if (v4)
  {
    v6 = (NSString *)-[NSString copy](self->_string, "copy");
    originalString = self->_originalString;
    self->_originalString = v6;

  }
}

- (void)setObject:(id)a3 forVariant:(int64_t)a4
{
  id v6;
  AXIndexMap *variants;
  AXIndexMap *v8;
  AXIndexMap *v9;
  id v10;

  v6 = a3;
  if (v6)
  {
    variants = self->_variants;
    v10 = v6;
    if (!variants)
    {
      v8 = (AXIndexMap *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CF3980]), "init");
      v9 = self->_variants;
      self->_variants = v8;

      variants = self->_variants;
    }
    -[AXIndexMap setObject:forIndex:](variants, "setObject:forIndex:", v10, a4);
    v6 = v10;
  }

}

- (id)objectForVariant:(int64_t)a3
{
  return (id)-[AXIndexMap objectForIndex:](self->_variants, "objectForIndex:", a3);
}

- (void)removeObjectForVariant:(int64_t)a3
{
  -[AXIndexMap removeObjectForIndex:](self->_variants, "removeObjectForIndex:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)AXOutputAction;
  -[AXOutputAction description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] String: %@, Original String: %@, Braille String: %@, variants: %@"), v4, self->_string, self->_originalString, self->_brailleString, self->_variants);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4[6] == self->_outputActionID;

  return v5;
}

- (unint64_t)hash
{
  return self->_outputActionID;
}

- (AXIndexMap)outputVariants
{
  return self->_variants;
}

- (_NSRange)rangeOfString
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_rangeOfString.length;
  location = self->_rangeOfString.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_storeStrong((id *)&self->_string, a3);
}

- (NSString)brailleString
{
  return self->_brailleString;
}

- (void)setBrailleString:(id)a3
{
  objc_storeStrong((id *)&self->_brailleString, a3);
}

- (NSString)originalString
{
  return self->_originalString;
}

- (BOOL)generatesBraille
{
  return self->_generatesBraille;
}

- (void)setGeneratesBraille:(BOOL)a3
{
  self->_generatesBraille = a3;
}

- (BOOL)performPunctuationTranslation
{
  return self->_performPunctuationTranslation;
}

- (void)setPerformPunctuationTranslation:(BOOL)a3
{
  self->_performPunctuationTranslation = a3;
}

- (BOOL)replaceCommas
{
  return self->_replaceCommas;
}

- (void)setReplaceCommas:(BOOL)a3
{
  self->_replaceCommas = a3;
}

- (BOOL)wasDivided
{
  return self->_wasDivided;
}

- (void)setWasDivided:(BOOL)a3
{
  self->_wasDivided = a3;
}

- (unint64_t)outputActionID
{
  return self->_outputActionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalString, 0);
  objc_storeStrong((id *)&self->_brailleString, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_variants, 0);
}

@end
