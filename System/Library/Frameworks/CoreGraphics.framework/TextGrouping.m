@implementation TextGrouping

- (TextGrouping)initWithTextElement:(id)a3 text:(id)a4
{
  id v6;
  id v7;
  TextGrouping *v8;
  TextGrouping *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TextGrouping;
  v8 = -[TextGrouping init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[TextGrouping setText:](v8, "setText:", v7);
    objc_msgSend(v6, "boundingQuad");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TextGrouping setBoundingQuad:](v9, "setBoundingQuad:", v10);

    -[TextGrouping setLayoutDirection:](v9, "setLayoutDirection:", 1);
    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TextGrouping setSubregions:](v9, "setSubregions:", v11);

    -[TextGrouping setTextRegionType:](v9, "setTextRegionType:", 2);
  }

  return v9;
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (unint64_t)textRegionType
{
  return self->_textRegionType;
}

- (void)setTextRegionType:(unint64_t)a3
{
  self->_textRegionType = a3;
}

- (CRNormalizedQuad)boundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBoundingQuad:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(unint64_t)a3
{
  self->_layoutDirection = a3;
}

- (NSArray)subregions
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSubregions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subregions, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
