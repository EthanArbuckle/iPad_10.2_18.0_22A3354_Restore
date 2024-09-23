@implementation VNCoreSceneUnderstandingDetectorTaxonomy

- (id)_initWithLabels:(id)a3 classificationMetricsForLabelDictionary:(id)a4
{
  id v6;
  id v7;
  VNCoreSceneUnderstandingDetectorTaxonomy *v8;
  uint64_t v9;
  NSArray *labels;
  uint64_t v11;
  NSDictionary *classificationMetricsForLabelDictionary;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VNCoreSceneUnderstandingDetectorTaxonomy;
  v8 = -[VNCoreSceneUnderstandingDetectorTaxonomy init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    labels = v8->_labels;
    v8->_labels = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    classificationMetricsForLabelDictionary = v8->_classificationMetricsForLabelDictionary;
    v8->_classificationMetricsForLabelDictionary = (NSDictionary *)v11;

  }
  return v8;
}

- (id)labelsFilteredByDisallowedList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[VNCoreSceneUnderstandingDetectorTaxonomy labels](self, "labels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75__VNCoreSceneUnderstandingDetectorTaxonomy_labelsFilteredByDisallowedList___block_invoke;
    v10[3] = &unk_1E4546E88;
    v11 = v4;
    objc_msgSend(v5, "indexesOfObjectsPassingTest:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v7 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v7, "removeObjectsAtIndexes:", v6);
      v8 = objc_msgSend(v7, "copy");

      v5 = (void *)v8;
    }

  }
  return v5;
}

- (id)classificationMetricsForLabel:(id)a3
{
  -[NSDictionary objectForKey:](self->_classificationMetricsForLabelDictionary, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)labels
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationMetricsForLabelDictionary, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

uint64_t __75__VNCoreSceneUnderstandingDetectorTaxonomy_labelsFilteredByDisallowedList___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsIdentifier:", a2);
}

+ (id)taxonomyForCSUTaxonomy:(id)a3 vocabularyNames:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD aBlock[4];
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = a4;
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__29_23236;
  v40 = __Block_byref_object_dispose__30_23237;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__VNCoreSceneUnderstandingDetectorTaxonomy_taxonomyForCSUTaxonomy_vocabularyNames_error___block_invoke;
  aBlock[3] = &unk_1E4546E60;
  v9 = v19;
  v27 = v9;
  v10 = v20;
  v28 = v10;
  v30 = &v36;
  v31 = &v32;
  v11 = v8;
  v29 = v11;
  v12 = _Block_copy(aBlock);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v21;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v42, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(v10, "enumerateLabelsInVocabularyNamed:usingBlock:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), v12);
        if (!*((_BYTE *)v33 + 24))
        {
          if (a5)
            *a5 = objc_retainAutorelease((id)v37[5]);

          v17 = 0;
          goto LABEL_13;
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v42, 16);
      if (v14)
        continue;
      break;
    }
  }

  objc_msgSend(v9, "sortUsingSelector:", sel_compare_);
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithLabels:classificationMetricsForLabelDictionary:", v9, v11);
LABEL_13:

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v17;
}

void __89__VNCoreSceneUnderstandingDetectorTaxonomy_taxonomyForCSUTaxonomy_vocabularyNames_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  id obj;
  id v11;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  v6 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v7 + 40);
  v11 = 0;
  v8 = objc_msgSend(v6, "VNGetClassificationMetrics:forLabel:error:", &v11, v5, &obj);
  v9 = v11;
  objc_storeStrong((id *)(v7 + 40), obj);
  if ((v8 & 1) != 0)
  {
    if (v9)
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v9, v5);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    *a3 = 1;
  }

}

@end
