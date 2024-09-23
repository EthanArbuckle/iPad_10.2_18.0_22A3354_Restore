@implementation SGSignificantEmailAddressModelForIMessage

+ (id)newTransformerInstanceForLanguage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SGTransformerInstance *v15;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v20 = a3;
  +[SGTransformerInstance defaultWindowAndNgrams](SGTransformerInstance, "defaultWindowAndNgrams");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D19EE0];
  +[SGEntityMatchingTransformer withTargetMapping:phoneMapping:emailMapping:addressMapping:andDateMapping:](SGEntityMatchingTransformer, "withTargetMapping:phoneMapping:emailMapping:addressMapping:andDateMapping:", CFSTR("SG_TARGET_EMAIL"), CFSTR("SG_FEATURE_PHONENUMBER"), CFSTR("SG_FEATURE_EMAIL"), CFSTR("SG_FEATURE_ADDRESS"), CFSTR("SG_FEATURE_DATE"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v21;
  +[SGEntityMappingTransformer withEmailMapping:linkMapping:](SGEntityMappingTransformer, "withEmailMapping:linkMapping:", CFSTR("SG_FEATURE_EMAIL"), CFSTR("SG_FEATURE_LINK"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v19;
  +[SGTokenizerMappingTransformer forLocale:withPersonalNameMapping:](SGTokenizerMappingTransformer, "forLocale:withPersonalNameMapping:", v20, CFSTR("SG_FEATURE_FULLNAME"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v18;
  +[SGNameMappingTransformer withFullNameMapping:firstNameMapping:lastNameMapping:andPossessive:](SGNameMappingTransformer, "withFullNameMapping:firstNameMapping:lastNameMapping:andPossessive:", CFSTR("SG_FEATURE_FULLNAME"), CFSTR("SG_FEATURE_FIRSTNAME"), CFSTR("SG_FEATURE_LASTNAME"), CFSTR("SG_POSSESSIVE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v4;
  +[SGSymbolicMappingTransformer withNumericMapping:andSymbolicMapping:](SGSymbolicMappingTransformer, "withNumericMapping:andSymbolicMapping:", CFSTR("SG_FEATURE_NUMBER"), CFSTR("SG_FEATURE_SYMBOL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "withTransformers:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGConversationFlatteningTransformer withPerMessageTransformer:](SGConversationFlatteningTransformer, "withPerMessageTransformer:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  v9 = (void *)MEMORY[0x1E0D81028];
  objc_msgSend(v17, "second");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "withBucketSize:andNgrams:", 10000, objc_msgSend(v10, "intValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "withTransformers:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[SGTransformerInstance defaultSessionDescriptorForModelId:featureVersion:language:windowAndNgrams:](SGTransformerInstance, "defaultSessionDescriptorForModelId:featureVersion:language:windowAndNgrams:", CFSTR("SignificantEmailAddressForIMessage"), CFSTR("1.5"), v20, v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[SGTransformerInstance initWithTransformer:sessionDescriptor:modelClass:]([SGTransformerInstance alloc], "initWithTransformer:sessionDescriptor:modelClass:", v13, v14, objc_opt_class());
  return v15;
}

@end
