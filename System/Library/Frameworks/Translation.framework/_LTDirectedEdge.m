@implementation _LTDirectedEdge

+ (id)meaningEdgeWithTargetPhraseIndex:(unint64_t)a3 targetPreview:(id)a4 meaningDescription:(id)a5 targetGender:(id)a6 defaultGender:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTargetPhraseIndex:type:targetPreview:targetGender:defaultGender:menuDescription:", a3, 0, v15, v13, v12, v14);

  return v16;
}

+ (id)genderEdgeWithTargetPhraseIndex:(unint64_t)a3 targetPreview:(id)a4 gender:(unint64_t)a5 defaultGender:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a4;
  v11 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  menuDescriptionForGender(a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "_initWithTargetPhraseIndex:type:targetPreview:targetGender:defaultGender:menuDescription:", a3, 1, v10, v12, v13, v14);

  return v15;
}

- (id)_initWithTargetPhraseIndex:(unint64_t)a3 type:(unint64_t)a4 targetPreview:(id)a5 targetGender:(id)a6 defaultGender:(id)a7 menuDescription:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  _LTDirectedEdge *v18;
  _LTDirectedEdge *v19;
  uint64_t v20;
  NSString *targetPreview;
  uint64_t v22;
  NSString *menuDescription;
  _LTDirectedEdge *v24;
  objc_super v26;

  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)_LTDirectedEdge;
  v18 = -[_LTDirectedEdge init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_targetPhraseIndex = a3;
    v18->_type = a4;
    v20 = objc_msgSend(v14, "copy");
    targetPreview = v19->_targetPreview;
    v19->_targetPreview = (NSString *)v20;

    objc_storeStrong((id *)&v19->_targetGender, a6);
    objc_storeStrong((id *)&v19->_defaultGender, a7);
    v22 = objc_msgSend(v17, "copy");
    menuDescription = v19->_menuDescription;
    v19->_menuDescription = (NSString *)v22;

    v24 = v19;
  }

  return v19;
}

- (int64_t)compare:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  id v21;

  v4 = a3;
  v5 = -[_LTDirectedEdge type](self, "type");
  v6 = objc_msgSend(v4, "type");
  if (v5 != v6)
  {
    v11 = v6;
    v12 = (void *)MEMORY[0x24BDD16E0];
    sortOrderForType(v5);
    objc_msgSend(v12, "numberWithUnsignedInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD16E0];
    sortOrderForType(v11);
LABEL_7:
    v10 = v13;
    v9 = v11;
    goto LABEL_8;
  }
  if (v5 == 1)
  {
    -[_LTDirectedEdge targetGender](self, "targetGender");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntegerValue");

    objc_msgSend(v4, "targetGender");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v16, "unsignedIntegerValue");

    v17 = (void *)MEMORY[0x24BDD16E0];
    sortOrderForGender(v15);
    objc_msgSend(v17, "numberWithUnsignedInteger:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD16E0];
    sortOrderForGender(v11);
    goto LABEL_7;
  }
  if (v5)
  {
    unexpectedDisambiguationTypeException(v5);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[_LTDirectedEdge targetPhraseIndex](self, "targetPhraseIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = objc_msgSend(v4, "targetPhraseIndex");
  v10 = v8;
LABEL_8:
  objc_msgSend(v10, "numberWithUnsignedInteger:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v7, "compare:", v18);

  return v19;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _LTDisambiguationTypeDescription(-[_LTDirectedEdge type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_LTDirectedEdge targetPhraseIndex](self, "targetPhraseIndex");
  -[_LTDirectedEdge targetPreview](self, "targetPreview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTDirectedEdge menuDescription](self, "menuDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTDirectedEdge defaultGender](self, "defaultGender");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    menuDescriptionForGender(objc_msgSend(v10, "unsignedIntegerValue"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("n/a");
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; type: %@; targetIndex: %zu; preview: %@; menuDescription: %@; defaultGender: %@>"),
    v5,
    self,
    v6,
    v7,
    v8,
    v9,
    v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[_LTDirectedEdge type](self, "type");
    if (v6 == objc_msgSend(v5, "type")
      && (v7 = -[_LTDirectedEdge targetPhraseIndex](self, "targetPhraseIndex"),
          v7 == objc_msgSend(v5, "targetPhraseIndex")))
    {
      -[_LTDirectedEdge targetPreview](self, "targetPreview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "targetPreview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        -[_LTDirectedEdge menuDescription](self, "menuDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "menuDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v11))
        {
          -[_LTDirectedEdge targetGender](self, "targetGender");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "targetGender");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (_LTIsEqual(v12, v13))
          {
            -[_LTDirectedEdge defaultGender](self, "defaultGender");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "defaultGender");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = _LTIsEqual(v17, v14);

          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[_LTDirectedEdge type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_LTDirectedEdge targetPreview](self, "targetPreview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[_LTDirectedEdge menuDescription](self, "menuDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  -[_LTDirectedEdge targetGender](self, "targetGender");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");
  -[_LTDirectedEdge defaultGender](self, "defaultGender");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash") ^ v4;

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t targetPhraseIndex;
  id v5;

  targetPhraseIndex = self->_targetPhraseIndex;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", targetPhraseIndex, CFSTR("targetPhraseIndex"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_targetPreview, CFSTR("targetPreview"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_targetGender, CFSTR("targetGender"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_defaultGender, CFSTR("defaultGender"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_menuDescription, CFSTR("menuDescription"));

}

- (_LTDirectedEdge)initWithCoder:(id)a3
{
  id v4;
  _LTDirectedEdge *v5;
  uint64_t v6;
  NSString *targetPreview;
  uint64_t v8;
  NSNumber *targetGender;
  uint64_t v10;
  NSNumber *defaultGender;
  uint64_t v12;
  NSString *menuDescription;
  _LTDirectedEdge *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_LTDirectedEdge;
  v5 = -[_LTDirectedEdge init](&v16, sel_init);
  if (v5)
  {
    v5->_targetPhraseIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("targetPhraseIndex"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetPreview"));
    v6 = objc_claimAutoreleasedReturnValue();
    targetPreview = v5->_targetPreview;
    v5->_targetPreview = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetGender"));
    v8 = objc_claimAutoreleasedReturnValue();
    targetGender = v5->_targetGender;
    v5->_targetGender = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultGender"));
    v10 = objc_claimAutoreleasedReturnValue();
    defaultGender = v5->_defaultGender;
    v5->_defaultGender = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("menuDescription"));
    v12 = objc_claimAutoreleasedReturnValue();
    menuDescription = v5->_menuDescription;
    v5->_menuDescription = (NSString *)v12;

    v14 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  unint64_t targetPhraseIndex;
  unint64_t type;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  targetPhraseIndex = self->_targetPhraseIndex;
  type = self->_type;
  v7 = (void *)-[NSString copy](self->_targetPreview, "copy");
  v8 = (void *)-[NSNumber copy](self->_targetGender, "copy");
  v9 = (void *)-[NSNumber copy](self->_defaultGender, "copy");
  v10 = (void *)-[NSString copy](self->_menuDescription, "copy");
  v11 = (void *)objc_msgSend(v4, "_initWithTargetPhraseIndex:type:targetPreview:targetGender:defaultGender:menuDescription:", targetPhraseIndex, type, v7, v8, v9, v10);

  return v11;
}

- (unint64_t)targetPhraseIndex
{
  return self->_targetPhraseIndex;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)targetPreview
{
  return self->_targetPreview;
}

- (NSNumber)targetGender
{
  return self->_targetGender;
}

- (NSNumber)defaultGender
{
  return self->_defaultGender;
}

- (NSString)menuDescription
{
  return self->_menuDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuDescription, 0);
  objc_storeStrong((id *)&self->_defaultGender, 0);
  objc_storeStrong((id *)&self->_targetGender, 0);
  objc_storeStrong((id *)&self->_targetPreview, 0);
}

@end
