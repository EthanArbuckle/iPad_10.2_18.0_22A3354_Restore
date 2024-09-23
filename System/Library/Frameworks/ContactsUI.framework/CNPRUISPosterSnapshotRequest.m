@implementation CNPRUISPosterSnapshotRequest

- (CNPRUISPosterSnapshotRequest)initWithWrappedRequest:(id)a3
{
  id v5;
  CNPRUISPosterSnapshotRequest *v6;
  CNPRUISPosterSnapshotRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNPRUISPosterSnapshotRequest;
  v6 = -[CNPRUISPosterSnapshotRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_wrappedRequest, a3);

  return v7;
}

- (PRUISPosterSnapshotRequest)wrappedRequest
{
  return self->_wrappedRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedRequest, 0);
}

+ (id)requestForConfiguration:(id)a3 definition:(id)a4 interfaceOrientation:(int64_t)a5
{
  Class (__cdecl *v7)();
  id v8;
  id v9;
  Class v10;
  void *v11;
  void *v12;
  void *v13;
  CNPRUISPosterSnapshotRequest *v14;
  void *v15;
  CNPRUISPosterSnapshotRequest *v16;

  v7 = (Class (__cdecl *)())getPRUISPosterSnapshotRequestClass;
  v8 = a4;
  v9 = a3;
  v10 = v7();
  objc_msgSend(v9, "wrappedPosterConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "wrappedDefinition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class snapshotRequestForPRSPosterConfiguration:definition:interfaceOrientation:](v10, "snapshotRequestForPRSPosterConfiguration:definition:interfaceOrientation:", v11, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [CNPRUISPosterSnapshotRequest alloc];
  v15 = (void *)objc_msgSend(v13, "copy");
  v16 = -[CNPRUISPosterSnapshotRequest initWithWrappedRequest:](v14, "initWithWrappedRequest:", v15);

  return v16;
}

+ (id)requestForConfiguration:(id)a3 definition:(id)a4 interfaceOrientation:(int64_t)a5 windowScene:(id)a6 attachments:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  Class PRUISPosterSnapshotRequestClass;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CNPRUISPosterSnapshotRequest *v21;
  void *v22;
  CNPRUISPosterSnapshotRequest *v23;

  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(a7, "_cn_map:", &__block_literal_global_307_61473);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PRUISPosterSnapshotRequestClass = getPRUISPosterSnapshotRequestClass();
  objc_msgSend(v13, "wrappedPosterConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "wrappedDefinition");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class snapshotRequestForPRSPosterConfiguration:definition:interfaceOrientation:](PRUISPosterSnapshotRequestClass, "snapshotRequestForPRSPosterConfiguration:definition:interfaceOrientation:", v16, v17, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(v18, "mutableCopy");
  objc_msgSend((Class)getPRUISPosterAttachmentConfigurationClass[0](), "attachmentConfigurationWithHostWindowScene:attachments:", v11, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setAttachmentConfiguration:", v20);
  v21 = [CNPRUISPosterSnapshotRequest alloc];
  v22 = (void *)objc_msgSend(v19, "copy");
  v23 = -[CNPRUISPosterSnapshotRequest initWithWrappedRequest:](v21, "initWithWrappedRequest:", v22);

  return v23;
}

uint64_t __112__CNPRUISPosterSnapshotRequest_requestForConfiguration_definition_interfaceOrientation_windowScene_attachments___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attachment");
}

@end
