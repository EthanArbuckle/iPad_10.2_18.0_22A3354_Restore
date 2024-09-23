@implementation MPModelObjectMediaItem

- (MPModelObjectMediaItem)initWithModelObject:(id)a3
{
  id v5;
  MPModelObjectMediaItem *v6;
  MPModelObjectMediaItem *v7;
  uint64_t v8;
  NSDictionary *propertyValues;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPModelObjectMediaItem;
  v6 = -[MPModelObjectMediaItem init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_modelObject, a3);
    objc_msgSend(v5, "mediaItemPropertyValues");
    v8 = objc_claimAutoreleasedReturnValue();
    propertyValues = v7->_propertyValues;
    v7->_propertyValues = (NSDictionary *)v8;

  }
  return v7;
}

- (MPModelObjectMediaItem)initWithPersistentID:(unint64_t)a3
{
  void *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelObjectMediaItem.m"), 286, CFSTR("MPModelObjectMediaItem initWithPersistentID: is not supported. Use initWithModelObject: instead."));

  v7.receiver = self;
  v7.super_class = (Class)MPModelObjectMediaItem;
  return -[MPModelObjectMediaItem init](&v7, sel_init);
}

- (unint64_t)persistentID
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[MPModelObject identifiers](self->_modelObject, "identifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "library");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "persistentID");

  return v4;
}

- (MPModelObjectMediaItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MPModelObjectMediaItem *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[MPModelObjectMediaItem initWithModelObject:](self, "initWithModelObject:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_modelObject, CFSTR("mo"));
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[MPModelObject isEqual:](self->_modelObject, "isEqual:", v4[5]);

  return v5;
}

- (unint64_t)hash
{
  return -[MPModelObject hash](self->_modelObject, "hash");
}

- (id)valueForProperty:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  char v7;
  void *v8;
  void *v9;
  MPConcreteMediaItemArtwork *v10;
  MPConcreteMediaItemArtwork *v11;
  MPConcreteMediaItemArtwork *v12;
  void (**fallbackArtworkCatalogBlock)(void);
  uint64_t v14;
  void *v15;
  objc_super v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("artwork")))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__17846;
    v23 = __Block_byref_object_dispose__17847;
    v24 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __43__MPModelObjectMediaItem_valueForProperty___block_invoke;
      v18[3] = &unk_1E3163580;
      v18[4] = self;
      v18[5] = &v19;
      +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v18);
      objc_msgSend((id)v20[5], "token");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      v7 = isKindOfClass ^ 1;
    }
    else
    {
      v7 = 1;
    }
    if (v20[5]
      || (fallbackArtworkCatalogBlock = (void (**)(void))self->_fallbackArtworkCatalogBlock) != 0
      && (fallbackArtworkCatalogBlock[2](),
          v14 = objc_claimAutoreleasedReturnValue(),
          v15 = (void *)v20[5],
          v20[5] = v14,
          v15,
          v20[5]))
    {
      v11 = [MPConcreteMediaItemArtwork alloc];
      v12 = -[MPConcreteMediaItemArtwork initWithArtworkCatalog:allowsNetworking:](v11, "initWithArtworkCatalog:allowsNetworking:", v20[5], v7 & 1);
    }
    else
    {
      v12 = 0;
    }
    _Block_object_dispose(&v19, 8);

  }
  else
  {
    -[NSDictionary valueForKey:](self->_propertyValues, "valueForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)MPModelObjectMediaItem;
      -[MPNondurableMediaItem valueForProperty:](&v17, sel_valueForProperty_, v4);
      v10 = (MPConcreteMediaItemArtwork *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v10;

  }
  return v12;
}

- (MPModelObject)modelObject
{
  return self->_modelObject;
}

- (id)fallbackArtworkCatalogBlock
{
  return self->_fallbackArtworkCatalogBlock;
}

- (void)setFallbackArtworkCatalogBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fallbackArtworkCatalogBlock, 0);
  objc_storeStrong((id *)&self->_modelObject, 0);
  objc_storeStrong((id *)&self->_propertyValues, 0);
}

void __43__MPModelObjectMediaItem_valueForProperty___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "artworkCatalog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
