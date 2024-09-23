@implementation CSUSceneNetV5CustomClassifierConfiguration

+ (id)classifierAlphaConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;

  v7 = (void *)MEMORY[0x24BDD1488];
  v8 = objc_opt_class();
  objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  if (a3 == 1 || a3 == -1)
  {
    objc_msgSend_pathForResource_ofType_inDirectory_(v12, v13, (uint64_t)CFSTR("EventsLeaf_v0.5.0_89sf2c9ryr-157700"), (uint64_t)CFSTR("espresso.net"), (uint64_t)CFSTR("scenenet_v5_custom_classifiers/EventsLeaf/EventsLeaf_v0.5.0"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pathForResource_ofType_inDirectory_(v16, v18, (uint64_t)CFSTR("Events-v1c_manifest"), (uint64_t)CFSTR("bplist"), (uint64_t)CFSTR("taxonomies/events/"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_validateAndInitCustomClassifierForRevision_forNetworkPath_forTaxonomyPath_withInputImageTensorName_withVocabularyName_withClassificationTensorName_withIdentifier_error_(a1, v20, 1, (uint64_t)v17, (uint64_t)v19, CFSTR("2590"), CFSTR("basic"), CFSTR("events_fc_post_act_1"), 1, a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v13, a3, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v22, v23, (uint64_t)CFSTR("Unsupported Classifier Alpha revision %@"), v24, v25, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v26, (uint64_t)v19, v27, v28);
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

+ (id)junkLeafConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;

  v7 = (void *)MEMORY[0x24BDD1488];
  v8 = objc_opt_class();
  objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  if (a3 == 1 || a3 == -1)
  {
    objc_msgSend_pathForResource_ofType_inDirectory_(v12, v13, (uint64_t)CFSTR("JunkLeaf_v0.11.0_y8pf7cunms-10000"), (uint64_t)CFSTR("espresso.net"), (uint64_t)CFSTR("scenenet_v5_custom_classifiers/JunkLeaf/JunkLeaf_v0.11.0/"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pathForResource_ofType_inDirectory_(v16, v18, (uint64_t)CFSTR("Junk-v3b_manifest"), (uint64_t)CFSTR("bplist"), (uint64_t)CFSTR("taxonomies/junk/"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_validateAndInitCustomClassifierForRevision_forNetworkPath_forTaxonomyPath_withInputImageTensorName_withVocabularyName_withClassificationTensorName_withIdentifier_error_(a1, v20, 1, (uint64_t)v17, (uint64_t)v19, CFSTR("2593"), CFSTR("leaf"), CFSTR("fc_leaf_post_act_1"), 2, a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v13, a3, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v22, v23, (uint64_t)CFSTR("Unsupported Junk Leaf revision %@"), v24, v25, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v26, (uint64_t)v19, v27, v28);
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

+ (id)junkHierarchicalConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;

  v7 = (void *)MEMORY[0x24BDD1488];
  v8 = objc_opt_class();
  objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  if (a3 == 1 || a3 == -1)
  {
    objc_msgSend_pathForResource_ofType_inDirectory_(v12, v13, (uint64_t)CFSTR("JunkHierarchical_v0.11.0_y8pf7cunms-10000"), (uint64_t)CFSTR("espresso.net"), (uint64_t)CFSTR("scenenet_v5_custom_classifiers/JunkHierarchical/JunkHierarchical_v0.11.0/"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pathForResource_ofType_inDirectory_(v16, v18, (uint64_t)CFSTR("Junk-v3b_manifest"), (uint64_t)CFSTR("bplist"), (uint64_t)CFSTR("taxonomies/junk/"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_validateAndInitCustomClassifierForRevision_forNetworkPath_forTaxonomyPath_withInputImageTensorName_withVocabularyName_withClassificationTensorName_withIdentifier_error_(a1, v20, 1, (uint64_t)v17, (uint64_t)v19, CFSTR("2593"), CFSTR("hierarchical"), CFSTR("fc_hier_post_act_1"), 3, a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v13, a3, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v22, v23, (uint64_t)CFSTR("Unsupported Junk Hierarchical revision %@"), v24, v25, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v26, (uint64_t)v19, v27, v28);
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

+ (id)cityNatureConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;

  v7 = (void *)MEMORY[0x24BDD1488];
  v8 = objc_opt_class();
  objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  if (a3 == 1 || a3 == -1)
  {
    objc_msgSend_pathForResource_ofType_inDirectory_(v12, v13, (uint64_t)CFSTR("UrbanNatureLeaf_v0.1.0_ccinynq7s3-5000"), (uint64_t)CFSTR("espresso.net"), (uint64_t)CFSTR("scenenet_v5_custom_classifiers/CityNature/CityNature_v0.1.0"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pathForResource_ofType_inDirectory_(v16, v18, (uint64_t)CFSTR("CityNature-v1a_manifest"), (uint64_t)CFSTR("bplist"), (uint64_t)CFSTR("taxonomies/citynature/"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_validateAndInitCustomClassifierForRevision_forNetworkPath_forTaxonomyPath_withInputImageTensorName_withVocabularyName_withClassificationTensorName_withIdentifier_error_(a1, v20, 1, (uint64_t)v17, (uint64_t)v19, CFSTR("2590"), CFSTR("basic"), CFSTR("fc_leaf_post_act_1"), 4, a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v13, a3, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v22, v23, (uint64_t)CFSTR("Unsupported CityNature revision %@"), v24, v25, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v26, (uint64_t)v19, v27, v28);
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

+ (id)classifierBetaConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;

  v7 = (void *)MEMORY[0x24BDD1488];
  v8 = objc_opt_class();
  objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  if (a3 == 1 || a3 == -1)
  {
    objc_msgSend_pathForResource_ofType_inDirectory_(v12, v13, (uint64_t)CFSTR("semdev_23y8pwvx7w_18000"), (uint64_t)CFSTR("espresso.net"), (uint64_t)CFSTR("scenenet_v5_custom_classifiers/SemanticDevelopment/SemanticDevelopment_v1.0.0"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pathForResource_ofType_inDirectory_(v16, v18, (uint64_t)CFSTR("SemDev-v1a_manifest"), (uint64_t)CFSTR("bplist"), (uint64_t)CFSTR("taxonomies/semanticdeveloping/"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_validateAndInitCustomClassifierForRevision_forNetworkPath_forTaxonomyPath_withInputImageTensorName_withVocabularyName_withClassificationTensorName_withIdentifier_error_(a1, v20, 1, (uint64_t)v17, (uint64_t)v19, CFSTR("2590"), CFSTR("basic"), CFSTR("fc_leaf_post_act_1"), 5, a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!a4)
    {
      v21 = 0;
      goto LABEL_7;
    }
    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v13, a3, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v22, v23, (uint64_t)CFSTR("Unsupported Classifier Beta revision %@"), v24, v25, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v26, (uint64_t)v19, v27, v28);
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v21;
}

+ (id)validateAndInitCustomClassifierForRevision:(int64_t)a3 forNetworkPath:(id)a4 forTaxonomyPath:(id)a5 withInputImageTensorName:(id)a6 withVocabularyName:(id)a7 withClassificationTensorName:(id)a8 withIdentifier:(int64_t)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  const char *v25;
  void *inited;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v23 = a8;
  if (!v16)
  {
    objc_msgSend_errorForDataUnavailableWithLocalizedDescription_(CSUError, v20, (uint64_t)CFSTR("Missing custom classifier network files"), v21, v22);
LABEL_6:
    inited = 0;
    *a10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!v17)
  {
    objc_msgSend_errorForDataUnavailableWithLocalizedDescription_(CSUError, v20, (uint64_t)CFSTR("Missing custom classifier taxonomy files"), v21, v22);
    goto LABEL_6;
  }
  v24 = objc_alloc((Class)a1);
  inited = (void *)objc_msgSend_initConfigurationForRevision_espressoNetworkPath_inputImageTensorName_vocabularyName_taxonomyPath_identifier_classificationTensorName_(v24, v25, a3, (uint64_t)v16, (uint64_t)v18, v19, v17, a9, v23);
LABEL_7:

  return inited;
}

+ (id)availableClassifierAlphaRevisions
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_alloc_init(MEMORY[0x24BDD1698]);
  objc_msgSend_addIndex_(v2, v3, 1, v4, v5);
  return v2;
}

+ (id)availableJunkLeafRevisions
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_alloc_init(MEMORY[0x24BDD1698]);
  objc_msgSend_addIndex_(v2, v3, 1, v4, v5);
  return v2;
}

+ (id)availableJunkHierarchicalRevisions
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_alloc_init(MEMORY[0x24BDD1698]);
  objc_msgSend_addIndex_(v2, v3, 1, v4, v5);
  return v2;
}

+ (id)availableCityNatureRevisions
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_alloc_init(MEMORY[0x24BDD1698]);
  objc_msgSend_addIndex_(v2, v3, 1, v4, v5);
  return v2;
}

+ (id)availableClassifierBetaRevisions
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_alloc_init(MEMORY[0x24BDD1698]);
  objc_msgSend_addIndex_(v2, v3, 1, v4, v5);
  return v2;
}

- (id)taxonomyWithError:(id *)a3
{
  CSUSceneNetV5CustomClassifierTaxonomy *taxonomy;
  CSUSceneNetV5CustomClassifierTaxonomy *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  CSUSceneNetV5CustomClassifierTaxonomy *v14;
  CSUSceneNetV5CustomClassifierTaxonomy *v15;

  taxonomy = self->_taxonomy;
  if (!taxonomy)
  {
    v6 = [CSUSceneNetV5CustomClassifierTaxonomy alloc];
    objc_msgSend_taxonomyPath(self, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (CSUSceneNetV5CustomClassifierTaxonomy *)objc_msgSend_initWithManifestPath_error_(v6, v12, (uint64_t)v11, (uint64_t)a3, v13);
    v15 = self->_taxonomy;
    self->_taxonomy = v14;

    taxonomy = self->_taxonomy;
  }
  return taxonomy;
}

- (id)initConfigurationForRevision:(int64_t)a3 espressoNetworkPath:(id)a4 inputImageTensorName:(id)a5 vocabularyName:(id)a6 taxonomyPath:(id)a7 identifier:(int64_t)a8 classificationTensorName:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CSUSceneNetV5CustomClassifierConfiguration *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CSUSceneNetV5CustomClassifierConfiguration *v25;
  uint64_t v26;
  NSString *espressoNetworkPath;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSString *inputImageTensorName;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSString *vocabularyName;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSString *taxonomyPath;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSString *classificationTensorName;
  objc_super v53;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v53.receiver = self;
  v53.super_class = (Class)CSUSceneNetV5CustomClassifierConfiguration;
  v20 = -[CSUSceneNetV5CustomClassifierConfiguration init](&v53, sel_init);
  v25 = v20;
  if (v20)
  {
    v20->_revision = a3;
    v26 = objc_msgSend_copy(v15, v21, v22, v23, v24);
    espressoNetworkPath = v25->_espressoNetworkPath;
    v25->_espressoNetworkPath = (NSString *)v26;

    v32 = objc_msgSend_copy(v16, v28, v29, v30, v31);
    inputImageTensorName = v25->_inputImageTensorName;
    v25->_inputImageTensorName = (NSString *)v32;

    v38 = objc_msgSend_copy(v17, v34, v35, v36, v37);
    vocabularyName = v25->_vocabularyName;
    v25->_vocabularyName = (NSString *)v38;

    v44 = objc_msgSend_copy(v18, v40, v41, v42, v43);
    taxonomyPath = v25->_taxonomyPath;
    v25->_taxonomyPath = (NSString *)v44;

    v50 = objc_msgSend_copy(v19, v46, v47, v48, v49);
    classificationTensorName = v25->_classificationTensorName;
    v25->_classificationTensorName = (NSString *)v50;

    v25->_customClassifierIdentifier = a8;
  }

  return v25;
}

- (int)espressoExecutionEngine
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;

  objc_msgSend_computeDevice(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = sub_23A00ACE4(v5);

  return v6;
}

- (MLComputeDeviceProtocol)computeDevice
{
  return self->_computeDevice;
}

- (void)setComputeDevice:(id)a3
{
  objc_storeStrong((id *)&self->_computeDevice, a3);
}

- (NSString)vocabularyName
{
  return self->_vocabularyName;
}

- (int64_t)customClassifierIdentifier
{
  return self->_customClassifierIdentifier;
}

- (int64_t)revision
{
  return self->_revision;
}

- (NSString)espressoNetworkPath
{
  return self->_espressoNetworkPath;
}

- (NSString)inputImageTensorName
{
  return self->_inputImageTensorName;
}

- (NSString)taxonomyPath
{
  return self->_taxonomyPath;
}

- (NSString)classificationTensorName
{
  return self->_classificationTensorName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationTensorName, 0);
  objc_storeStrong((id *)&self->_taxonomyPath, 0);
  objc_storeStrong((id *)&self->_inputImageTensorName, 0);
  objc_storeStrong((id *)&self->_espressoNetworkPath, 0);
  objc_storeStrong((id *)&self->_vocabularyName, 0);
  objc_storeStrong((id *)&self->_computeDevice, 0);
  objc_storeStrong((id *)&self->_taxonomy, 0);
}

@end
