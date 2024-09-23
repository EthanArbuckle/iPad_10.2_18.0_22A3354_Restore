@implementation MADServicePrivate

+ (id)serviceName
{
  return CFSTR("com.apple.mediaanalysisd.analysis");
}

+ (id)serverProtocol
{
  return &unk_1EFEB07F8;
}

+ (id)allowedClasses
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[13];

  v6[12] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  v6[6] = objc_opt_class();
  v6[7] = objc_opt_class();
  v6[8] = objc_opt_class();
  v6[9] = objc_opt_class();
  v6[10] = objc_opt_class();
  v6[11] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allowedVideoRequestClasses
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allowedVideoResultClasses
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allowedTextRequestClasses
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allowedTextResultClasses
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allowedMultiModalRequestClasses
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)configureServerInterface:(id)a3
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
  objc_super v16;

  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___MADServicePrivate;
  v3 = a3;
  objc_msgSendSuper2(&v16, sel_configureServerInterface_, v3);
  objc_msgSend((id)objc_opt_class(), "allowedClasses", v16.receiver, v16.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_requestImageProcessing_forAssetWithIdentifier_identifierType_fromPhotoLibraryWithURL_requestID_andReply_, 0, 0);

  objc_msgSend((id)objc_opt_class(), "allowedClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_requestImageProcessing_forAssetWithIdentifier_identifierType_fromPhotoLibraryWithURL_requestID_andReply_, 0, 1);

  objc_msgSend((id)objc_opt_class(), "allowedClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_requestImageProcessing_forIOSurface_withOrientation_assetLocalIdentifier_photoLibraryURL_requestID_andReply_, 0, 0);

  objc_msgSend((id)objc_opt_class(), "allowedClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_requestImageProcessing_forIOSurface_withOrientation_assetLocalIdentifier_photoLibraryURL_requestID_andReply_, 0, 1);

  objc_msgSend((id)objc_opt_class(), "allowedClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_requestImageProcessing_forAssetWithCloudIdentifier_requestID_andReply_, 0, 0);

  objc_msgSend((id)objc_opt_class(), "allowedClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_requestImageProcessing_forAssetWithCloudIdentifier_requestID_andReply_, 0, 1);

  objc_msgSend((id)objc_opt_class(), "allowedClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_requestImageProcessingWithCloudIdentifierRequests_requestID_andReply_, 0, 0);

  objc_msgSend((id)objc_opt_class(), "allowedClasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_requestImageProcessingWithCloudIdentifierRequests_requestID_andReply_, 0, 1);

  objc_msgSend((id)objc_opt_class(), "allowedClasses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_requestImageProcessing_forImageData_withUniformTypeIdentifier_identifier_requestID_andReply_, 0, 0);

  objc_msgSend((id)objc_opt_class(), "allowedClasses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_requestImageProcessing_forImageData_withUniformTypeIdentifier_identifier_requestID_andReply_, 0, 1);

  objc_msgSend((id)objc_opt_class(), "allowedVideoRequestClasses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_requestVideoProcessing_assetIdentifier_identifierType_photoLibraryURL_requestID_isIncremental_reply_, 0, 0);

  objc_msgSend((id)objc_opt_class(), "allowedVideoResultClasses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_requestVideoProcessing_assetIdentifier_identifierType_photoLibraryURL_requestID_isIncremental_reply_, 0, 1);

}

@end
