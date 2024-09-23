@implementation GEOComposedStringOptions

- (GEOComposedStringOptions)init
{
  GEOComposedStringOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GEOComposedStringOptions;
  result = -[GEOComposedStringOptions init](&v3, sel_init);
  if (result)
    result->_shouldUpdateFormatStrings = 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSArray copy](self->_arguments, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  *(_BYTE *)(v4 + 8) = self->_createAttributedString;
  *(_BYTE *)(v4 + 9) = self->_preserveIndividualComponents;
  v7 = -[NSDictionary copy](self->_stringAttributes, "copy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  v9 = objc_msgSend(self->_formatStyleHandler, "copy");
  v10 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v9;

  *(_BYTE *)(v4 + 10) = self->_shouldUpdateFormatStrings;
  *(_BYTE *)(v4 + 11) = self->_isUpdatingFormatString;
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  int v15;
  BOOL v16;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = (void *)v5[2];
    v7 = self->_arguments;
    v8 = v6;
    if (v7 | v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend((id)v7, "isEqual:", v8);

      if (!v10)
        goto LABEL_11;
    }
    if (self->_createAttributedString == *((unsigned __int8 *)v5 + 8)
      && self->_preserveIndividualComponents == *((unsigned __int8 *)v5 + 9)
      && ((v11 = (void *)v5[3], v12 = self->_stringAttributes, v13 = v11, !(v12 | v13))
       || (v14 = (void *)v13, v15 = objc_msgSend((id)v12, "isEqual:", v13),
                              v14,
                              (id)v12,
                              v15))
      && self->_shouldUpdateFormatStrings == *((unsigned __int8 *)v5 + 10))
    {
      v16 = self->_isUpdatingFormatString == *((unsigned __int8 *)v5 + 11);
    }
    else
    {
LABEL_11:
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
  objc_storeStrong((id *)&self->_arguments, a3);
}

- (BOOL)createAttributedString
{
  return self->_createAttributedString;
}

- (void)setCreateAttributedString:(BOOL)a3
{
  self->_createAttributedString = a3;
}

- (BOOL)preserveIndividualComponents
{
  return self->_preserveIndividualComponents;
}

- (void)setPreserveIndividualComponents:(BOOL)a3
{
  self->_preserveIndividualComponents = a3;
}

- (NSDictionary)stringAttributes
{
  return self->_stringAttributes;
}

- (void)setStringAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_stringAttributes, a3);
}

- (id)formatStyleHandler
{
  return self->_formatStyleHandler;
}

- (void)setFormatStyleHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)shouldUpdateFormatStrings
{
  return self->_shouldUpdateFormatStrings;
}

- (void)setShouldUpdateFormatStrings:(BOOL)a3
{
  self->_shouldUpdateFormatStrings = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_formatStyleHandler, 0);
  objc_storeStrong((id *)&self->_stringAttributes, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
}

@end
