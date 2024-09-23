@implementation CSUSceneNetV5SceneTaxonomy

- (CSUSceneNetV5SceneTaxonomy)initWithManifestPath:(id)a3 error:(id *)a4
{
  id v6;
  CSUSceneNetV5SceneTaxonomy *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  CSUSceneNetV5SceneTaxonomyAttributes *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  objc_super v21;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CSUSceneNetV5SceneTaxonomy;
  v7 = -[CSUTaxonomy initWithManifestPath:error:](&v21, sel_initWithManifestPath_error_, v6, a4);
  v11 = (uint64_t *)v7;
  if (!v7)
    goto LABEL_7;
  if (!v7->super._labelAttributes)
  {
    if (!a4)
      goto LABEL_8;
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR("No label attributes found in SceneNet taxonomy %@"), v9, v10, v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithCode_message_(CSUError, v18, 6, (uint64_t)v17, v19);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
    a4 = 0;
    goto LABEL_8;
  }
  v12 = [CSUSceneNetV5SceneTaxonomyAttributes alloc];
  v15 = objc_msgSend_initWithAttributePaths_error_(v12, v13, v11[2], (uint64_t)a4, v14);
  v16 = (void *)v11[11];
  v11[11] = v15;

  if (!v11[11])
    goto LABEL_7;
  a4 = v11;
LABEL_8:

  return (CSUSceneNetV5SceneTaxonomy *)a4;
}

- (id)attributesForLabel:(id)a3 error:(id *)a4
{
  id v5;
  CSUSceneNetV5SceneLabelAttributes *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = [CSUSceneNetV5SceneLabelAttributes alloc];
  v9 = (void *)objc_msgSend_initWithTaxonomyAttributes_forLabel_(v6, v7, (uint64_t)self->_attributeManager, (uint64_t)v5, v8);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeManager, 0);
}

@end
