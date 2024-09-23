@implementation _LTUnvalidatedEdgeInfo

+ (id)meaningEdgeInfoWithTargetPhraseIndex:(unint64_t)a3 targetLinkIndex:(unint64_t)a4 meaningDescription:(id)a5
{
  id v8;
  void *v9;

  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTargetPhraseIndex:targetLinkIndex:type:meaningDescription:gender:defaultGender:", a3, a4, 0, v8, 0, 0);

  return v9;
}

+ (id)genderEdgeInfoWithTargetPhraseIndex:(unint64_t)a3 targetLinkIndex:(unint64_t)a4 gender:(unint64_t)a5 defaultGender:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v10 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "_initWithTargetPhraseIndex:targetLinkIndex:type:meaningDescription:gender:defaultGender:", a3, a4, 1, 0, v11, v12);

  return v13;
}

- (id)_initWithTargetPhraseIndex:(unint64_t)a3 targetLinkIndex:(unint64_t)a4 type:(unint64_t)a5 meaningDescription:(id)a6 gender:(id)a7 defaultGender:(id)a8
{
  id v14;
  id v15;
  id v16;
  _LTUnvalidatedEdgeInfo *v17;
  _LTUnvalidatedEdgeInfo *v18;
  uint64_t v19;
  NSString *meaningDescription;
  _LTUnvalidatedEdgeInfo *v21;
  objc_super v23;

  v14 = a6;
  v15 = a7;
  v16 = a8;
  v23.receiver = self;
  v23.super_class = (Class)_LTUnvalidatedEdgeInfo;
  v17 = -[_LTUnvalidatedEdgeInfo init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_type = a5;
    v17->_targetPhraseIndex = a3;
    v17->_targetLinkIndex = a4;
    v19 = objc_msgSend(v14, "copy");
    meaningDescription = v18->_meaningDescription;
    v18->_meaningDescription = (NSString *)v19;

    objc_storeStrong((id *)&v18->_targetGender, a7);
    objc_storeStrong((id *)&v18->_defaultGender, a8);
    v21 = v18;
  }

  return v18;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _LTDisambiguationTypeDescription(-[_LTUnvalidatedEdgeInfo type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_LTUnvalidatedEdgeInfo targetPhraseIndex](self, "targetPhraseIndex");
  v8 = -[_LTUnvalidatedEdgeInfo targetLinkIndex](self, "targetLinkIndex");
  -[_LTUnvalidatedEdgeInfo targetGender](self, "targetGender");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTUnvalidatedEdgeInfo defaultGender](self, "defaultGender");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTUnvalidatedEdgeInfo meaningDescription](self, "meaningDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; type: %@; targetIndex: %zu; linkIndex: %zu; gender: %@; defaultGender: %@; menuDescription: %@>"),
    v5,
    self,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  unint64_t targetLinkIndex;
  unint64_t targetPhraseIndex;
  unint64_t type;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  targetPhraseIndex = self->_targetPhraseIndex;
  targetLinkIndex = self->_targetLinkIndex;
  type = self->_type;
  v8 = (void *)-[NSString copy](self->_meaningDescription, "copy");
  v9 = (void *)-[NSNumber copy](self->_targetGender, "copy");
  v10 = (void *)-[NSNumber copy](self->_defaultGender, "copy");
  v11 = (void *)objc_msgSend(v4, "_initWithTargetPhraseIndex:targetLinkIndex:type:meaningDescription:gender:defaultGender:", targetPhraseIndex, targetLinkIndex, type, v8, v9, v10);

  return v11;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)targetPhraseIndex
{
  return self->_targetPhraseIndex;
}

- (unint64_t)targetLinkIndex
{
  return self->_targetLinkIndex;
}

- (NSNumber)targetGender
{
  return self->_targetGender;
}

- (NSNumber)defaultGender
{
  return self->_defaultGender;
}

- (NSString)meaningDescription
{
  return self->_meaningDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meaningDescription, 0);
  objc_storeStrong((id *)&self->_defaultGender, 0);
  objc_storeStrong((id *)&self->_targetGender, 0);
}

@end
