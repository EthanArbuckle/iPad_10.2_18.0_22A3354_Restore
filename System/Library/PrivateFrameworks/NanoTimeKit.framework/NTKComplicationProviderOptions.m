@implementation NTKComplicationProviderOptions

- (void)setSupportedDateStyles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setRankedFamilies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setAllowedComplicationTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setAllowGenericDateComplication:(BOOL)a3
{
  self->_allowGenericDateComplication = a3;
}

- (NSArray)rankedFamilies
{
  return self->_rankedFamilies;
}

- (NTKComplicationProviderOptions)init
{
  NTKComplicationProviderOptions *v2;
  uint64_t v3;
  NSIndexSet *allowedComplicationTypes;
  uint64_t v5;
  NSArray *rankedFamilies;
  uint64_t v7;
  NSArray *supportedDateStyles;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKComplicationProviderOptions;
  v2 = -[NTKComplicationProviderOptions init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    allowedComplicationTypes = v2->_allowedComplicationTypes;
    v2->_allowedComplicationTypes = (NSIndexSet *)v3;

    v5 = objc_opt_new();
    rankedFamilies = v2->_rankedFamilies;
    v2->_rankedFamilies = (NSArray *)v5;

    v7 = objc_opt_new();
    supportedDateStyles = v2->_supportedDateStyles;
    v2->_supportedDateStyles = (NSArray *)v7;

    *(_WORD *)&v2->_includeDisabledTypes = 0;
  }
  return v2;
}

- (BOOL)includeDisabledTypes
{
  return self->_includeDisabledTypes;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithOptions:", self);
}

- (NSIndexSet)allowedComplicationTypes
{
  return self->_allowedComplicationTypes;
}

- (id)_initWithOptions:(id)a3
{
  id v4;
  NTKComplicationProviderOptions *v5;
  uint64_t v6;
  NSIndexSet *allowedComplicationTypes;
  uint64_t v8;
  NSArray *rankedFamilies;
  uint64_t v10;
  NSArray *supportedDateStyles;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKComplicationProviderOptions;
  v5 = -[NTKComplicationProviderOptions init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(*((id *)v4 + 2), "copy");
    allowedComplicationTypes = v5->_allowedComplicationTypes;
    v5->_allowedComplicationTypes = (NSIndexSet *)v6;

    v8 = objc_msgSend(*((id *)v4 + 3), "copy");
    rankedFamilies = v5->_rankedFamilies;
    v5->_rankedFamilies = (NSArray *)v8;

    v10 = objc_msgSend(*((id *)v4 + 4), "copy");
    supportedDateStyles = v5->_supportedDateStyles;
    v5->_supportedDateStyles = (NSArray *)v10;

    v5->_includeDisabledTypes = *((_BYTE *)v4 + 8);
    v5->_allowGenericDateComplication = *((_BYTE *)v4 + 9);
  }

  return v5;
}

- (NSArray)supportedDateStyles
{
  return self->_supportedDateStyles;
}

- (void)setIncludeDisabledTypes:(BOOL)a3
{
  self->_includeDisabledTypes = a3;
}

- (BOOL)allowGenericDateComplication
{
  return self->_allowGenericDateComplication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedDateStyles, 0);
  objc_storeStrong((id *)&self->_rankedFamilies, 0);
  objc_storeStrong((id *)&self->_allowedComplicationTypes, 0);
}

@end
