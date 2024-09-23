@implementation SGQuickResponsesClassificationModel

+ (id)newTransformerInstanceForLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5 vocabPath:(id)a6
{
  void *v6;
  id v7;

  +[SGQuickResponsesConfig configWithLanguage:mode:plistPath:vocabPath:](SGQuickResponsesConfig, "configWithLanguage:mode:plistPath:vocabPath:", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = +[SGQuickResponsesClassificationModel newTransformerInstanceForConfig:seed:useSeed:](SGQuickResponsesClassificationModel, "newTransformerInstanceForConfig:seed:useSeed:", v6, 0, 0);
  else
    v7 = 0;

  return v7;
}

+ (id)newTransformerInstanceForLanguage:(id)a3 withDictionary:(id)a4 withVocab:(id)a5 withSeed:(unint64_t)a6 forMode:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  SGQuickResponsesConfig *v14;
  id v15;

  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[SGQuickResponsesConfig initWithLanguage:mode:dictionary:vocab:]([SGQuickResponsesConfig alloc], "initWithLanguage:mode:dictionary:vocab:", v13, a7, v12, v11);

  if (v14)
    v15 = +[SGQuickResponsesClassificationModel newTransformerInstanceForConfig:seed:useSeed:](SGQuickResponsesClassificationModel, "newTransformerInstanceForConfig:seed:useSeed:", v14, a6, 1);
  else
    v15 = 0;

  return v15;
}

+ (id)featurizerWithMethods:(id)a3 bucketSize:(unint64_t)a4 characterNGramRange:(_NSRange)a5 tokenNGramRange:(_NSRange)a6 idVectorLength:(unint64_t)a7 extraIdOptions:(unint64_t)a8 vectorizerStrategy:(unint64_t)a9 vectorNormalization:(int64_t)a10 vocab:(id)a11
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v13;
  NSUInteger v14;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[3];

  length = a6.length;
  location = a6.location;
  v13 = a5.length;
  v14 = a5.location;
  v25[2] = *MEMORY[0x24BDAC8D0];
  v17 = a11;
  +[SGStringPreprocessingTransformer withMethods:](SGStringPreprocessingTransformer, "withMethods:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v18;
  LOBYTE(v24) = 0;
  LOBYTE(v23) = 0;
  objc_msgSend(MEMORY[0x24BE79AC0], "withBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:", a4, v14, v13, location, length, 0, v23, 0, v24, a7, a8, a9, a10, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v25[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGPipelineTransformer withTransformers:](SGPipelineTransformer, "withTransformers:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)newTransformerInstanceForConfig:(id)a3 seed:(unint64_t)a4 useSeed:(BOOL)a5
{
  id v7;
  SGModelSource *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  SGModelSampler *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  SGModelSampler *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  SGQuickResponsesTransformerInstance *v39;
  void *v41;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  SGModelSource *v53;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGQuickResponsesClassificationModel.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("config"));

  }
  v8 = [SGModelSource alloc];
  objc_msgSend(v7, "sessionDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = -[SGModelSource initWithSessionDescriptor:modelClass:](v8, "initWithSessionDescriptor:modelClass:", v9, objc_opt_class());

  objc_msgSend(v7, "preprocessingMethods");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modelHyperparameters");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v52, "vectorLength");
  objc_msgSend(v7, "modelHyperparameters");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v51, "characterNGramRange");
  v46 = v11;
  v47 = v10;
  objc_msgSend(v7, "modelHyperparameters");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v50, "tokenNGramRange");
  v44 = v13;
  v45 = v12;
  objc_msgSend(v7, "modelHyperparameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "idVectorLength");
  objc_msgSend(v7, "modelHyperparameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "extraIdOptions");
  objc_msgSend(v7, "modelHyperparameters");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "vectorizerStrategy");
  objc_msgSend(v7, "modelHyperparameters");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "vectorNormalization");
  objc_msgSend(v7, "vocab");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGQuickResponsesClassificationModel featurizerWithMethods:bucketSize:characterNGramRange:tokenNGramRange:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:](SGQuickResponsesClassificationModel, "featurizerWithMethods:bucketSize:characterNGramRange:tokenNGramRange:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:", v49, v48, v47, v46, v45, v44, v15, v17, v19, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "mode") == 1)
  {
    v24 = 0;
    v25 = 0;
  }
  else
  {
    if (a5)
      v26 = objc_msgSend(objc_alloc(MEMORY[0x24BE7A628]), "initWithSeed:", a4);
    else
      v26 = objc_opt_new();
    v27 = (void *)v26;
    objc_msgSend(v7, "preprocessingMethods");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "labels");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGTextLabelTransformer withMethods:withLabelStrings:](SGTextLabelTransformer, "withMethods:withLabelStrings:", v28, v29);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = [SGModelSampler alloc];
    objc_msgSend(v7, "classificationParams");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "positiveSamplingRate");
    v33 = v32;
    objc_msgSend(v7, "classificationParams");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dynamicLabelSamplingRate");
    v36 = v35;
    objc_msgSend(v7, "classificationParams");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "negativeSamplingRate");
    v25 = -[SGModelSampler initWithPositiveRate:dynamicLabelRate:negativeRate:rng:](v30, "initWithPositiveRate:dynamicLabelRate:negativeRate:rng:", v27, v33, v36, v38);

  }
  v39 = -[SGQuickResponsesTransformerInstance initWithConfig:featurizer:source:labeler:sampler:]([SGQuickResponsesTransformerInstance alloc], "initWithConfig:featurizer:source:labeler:sampler:", v7, v23, v53, v24, v25);

  return v39;
}

@end
