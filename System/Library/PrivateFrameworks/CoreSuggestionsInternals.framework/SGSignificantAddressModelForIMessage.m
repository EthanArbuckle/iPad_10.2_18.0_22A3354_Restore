@implementation SGSignificantAddressModelForIMessage

+ (id)newTransformerInstanceForLanguage:(id)a3
{
  id v3;
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
  void *v15;
  SGTransformerInstance *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[SGTransformerInstance defaultWindowAndNgrams](SGTransformerInstance, "defaultWindowAndNgrams");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGTransformerInstance defaultSessionDescriptorForModelId:featureVersion:language:windowAndNgrams:](SGTransformerInstance, "defaultSessionDescriptorForModelId:featureVersion:language:windowAndNgrams:", CFSTR("SignificantPostalAddressForIMessage"), CFSTR("1.5"), v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D19EE0];
  +[SGEntityMatchingTransformer withTargetMapping:phoneMapping:emailMapping:addressMapping:andDateMapping:](SGEntityMatchingTransformer, "withTargetMapping:phoneMapping:emailMapping:addressMapping:andDateMapping:", CFSTR("SG_TARGET_ADDRESS"), CFSTR("SG_FEATURE_PHONENUMBER"), CFSTR("SG_FEATURE_EMAIL"), CFSTR("SG_FEATURE_ADDRESS"), CFSTR("SG_FEATURE_DATE"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  +[SGEntityMappingTransformer withEmailMapping:linkMapping:](SGEntityMappingTransformer, "withEmailMapping:linkMapping:", CFSTR("SG_FEATURE_EMAIL"), CFSTR("SG_FEATURE_LINK"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v19;
  +[SGTokenizerMappingTransformer forLocale:withPersonalNameMapping:](SGTokenizerMappingTransformer, "forLocale:withPersonalNameMapping:", v3, CFSTR("SG_FEATURE_FULLNAME"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v22[2] = v5;
  +[SGNameMappingTransformer withFullNameMapping:firstNameMapping:lastNameMapping:andPossessive:](SGNameMappingTransformer, "withFullNameMapping:firstNameMapping:lastNameMapping:andPossessive:", CFSTR("SG_FEATURE_FULLNAME"), CFSTR("SG_FEATURE_FIRSTNAME"), CFSTR("SG_FEATURE_LASTNAME"), CFSTR("SG_POSSESSIVE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v6;
  +[SGSymbolicMappingTransformer withNumericMapping:andSymbolicMapping:](SGSymbolicMappingTransformer, "withNumericMapping:andSymbolicMapping:", CFSTR("SG_FEATURE_NUMBER"), CFSTR("SG_FEATURE_SYMBOL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "withTransformers:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGConversationFlatteningTransformer withPerMessageTransformer:](SGConversationFlatteningTransformer, "withPerMessageTransformer:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v10;
  v11 = (void *)MEMORY[0x1E0D81028];
  objc_msgSend(v18, "second");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "withBucketSize:andNgrams:", 10000, objc_msgSend(v12, "intValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "withTransformers:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[SGTransformerInstance initWithTransformer:sessionDescriptor:modelClass:]([SGTransformerInstance alloc], "initWithTransformer:sessionDescriptor:modelClass:", v15, v21, objc_opt_class());
  return v16;
}

@end
