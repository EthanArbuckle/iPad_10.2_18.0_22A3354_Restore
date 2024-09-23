@implementation SGMeCardDissector

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  SGPipelineEnrichment *v11;
  void *v12;
  SGContactDetailKey *v13;
  SGPipelineEnrichment *v14;
  void *v15;
  SGPipelineEnrichment *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  if ((objc_msgSend(v17, "isSent") & 1) == 0)
  {
    objc_msgSend(v17, "author");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "authorNickname");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "authorPhotoPath");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v8 | v9)
    {
      +[SGIdentityKey keyForPersonHandle:](SGIdentityKey, "keyForPersonHandle:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        if (v8)
        {
          v11 = -[SGPipelineEnrichment initWithPseudoContactWithKey:parent:name:]([SGPipelineEnrichment alloc], "initWithPseudoContactWithKey:parent:name:", v10, v6, v8);
          objc_msgSend(MEMORY[0x1E0D19820], "extractionInfoWithExtractionType:modelVersion:confidence:", 64, 0, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGEntity setExtractionInfo:](v11, "setExtractionInfo:", v12);

          objc_msgSend(v6, "setContactInformationExtracted:", 1);
          objc_msgSend(v6, "addOrReplacePreferredEnrichment:", v11);

        }
        if (v9)
        {
          v13 = -[SGContactDetailKey initWithIdentityKey:label:normalizedValue:]([SGContactDetailKey alloc], "initWithIdentityKey:label:normalizedValue:", v10, CFSTR("from_messages"), v9);
          v14 = [SGPipelineEnrichment alloc];
          objc_msgSend(MEMORY[0x1E0D19820], "extractionInfoWithExtractionType:modelVersion:confidence:", 64, 0, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[SGPipelineEnrichment initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:](v14, "initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:", v13, 5, v15, 0, v6, v9, &stru_1E7DB83A8, 0, 0);

          objc_msgSend(v6, "setContactInformationExtracted:", 1);
          objc_msgSend(v6, "addEnrichment:", v16);

        }
      }

    }
  }

}

@end
