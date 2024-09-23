@implementation DOCRootNode

- (_TtC26DocumentManagerExecutables11DOCRootNode)initWithSubject:(id)a3
{
  id v4;
  _TtC26DocumentManagerExecutables11DOCRootNode *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC26DocumentManagerExecutables11DOCRootNode_domain) = 0;
  v4 = a3;

  result = (_TtC26DocumentManagerExecutables11DOCRootNode *)sub_21EB033C8();
  __break(1u);
  return result;
}

- (_TtC26DocumentManagerExecutables11DOCRootNode)initWithCoder:(id)a3
{
  return (_TtC26DocumentManagerExecutables11DOCRootNode *)sub_21EA7B55C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC26DocumentManagerExecutables11DOCRootNode_domain, (void (*)(void))type metadata accessor for DOCRootNode);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables11DOCRootNode_domain));
}

- (id)identifier
{
  _TtC26DocumentManagerExecutables11DOCRootNode *v2;
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];

  v2 = self;
  v3 = -[FIProxyNode source](v2, sel_source);
  v4 = objc_msgSend(v3, sel_identifier);

  sub_21EB031B8();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_0(v7, v7[3]);
  v5 = (void *)sub_21EB034B8();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

- (FPItem)fpfs_fpItem
{
  return (FPItem *)sub_21EA7BF38(self, (uint64_t)a2, (SEL *)&selRef_fpfs_fpItem);
}

- (NSNumber)fileSize
{
  return (NSNumber *)sub_21EA7BF38(self, (uint64_t)a2, (SEL *)&selRef_fileSize);
}

- (FPProviderDomain)fpDomain
{
  return (FPProviderDomain *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                     + OBJC_IVAR____TtC26DocumentManagerExecutables11DOCRootNode_domain));
}

- (NSString)providerDomainID
{
  return (NSString *)sub_21EA7B874((char *)self, (uint64_t)a2, (SEL *)&selRef_identifier);
}

- (NSString)providerID
{
  return (NSString *)sub_21EA7B874((char *)self, (uint64_t)a2, (SEL *)&selRef_providerID);
}

- (NSDate)doc_lastUsedDate
{
  return (NSDate *)sub_21EA7B970(self, (uint64_t)a2, (SEL *)&selRef_doc_lastUsedDate);
}

- (NSDate)dateForSortingByRecents
{
  return (NSDate *)sub_21EA7B970(self, (uint64_t)a2, (SEL *)&selRef_dateForSortingByRecents);
}

- (NSString)filename
{
  _TtC26DocumentManagerExecutables11DOCRootNode *v2;
  id v3;
  id v4;
  void *v5;

  v2 = self;
  v3 = -[FIProxyNode source](v2, sel_source);
  v4 = objc_msgSend(v3, sel_filename);

  sub_21EB02B88();
  v5 = (void *)sub_21EB02B58();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (BOOL)isActionable
{
  return sub_21EA7BDC8(self, (uint64_t)a2, (SEL *)&selRef_isActionable);
}

- (BOOL)isReadable
{
  return sub_21EA7BDC8(self, (uint64_t)a2, (SEL *)&selRef_isReadable);
}

- (BOOL)isWritable
{
  return sub_21EA7BDC8(self, (uint64_t)a2, (SEL *)&selRef_isWritable);
}

- (BOOL)isPending
{
  return sub_21EA7BDC8(self, (uint64_t)a2, (SEL *)&selRef_isPending);
}

- (BOOL)isExternalDownloadPlaceholder
{
  return sub_21EA7BDC8(self, (uint64_t)a2, (SEL *)&selRef_isExternalDownloadPlaceholder);
}

- (BOOL)isCloudItem
{
  return sub_21EA7BDC8(self, (uint64_t)a2, (SEL *)&selRef_isCloudItem);
}

- (BOOL)isRootItem
{
  return 1;
}

- (BOOL)isDownloading
{
  return sub_21EA7BDC8(self, (uint64_t)a2, (SEL *)&selRef_isDownloading);
}

- (BOOL)isDownloaded
{
  return sub_21EA7BDC8(self, (uint64_t)a2, (SEL *)&selRef_isDownloaded);
}

- (NSProgress)downloadingProgress
{
  return (NSProgress *)sub_21EA7BF38(self, (uint64_t)a2, (SEL *)&selRef_downloadingProgress);
}

- (NSError)downloadingError
{
  return (NSError *)sub_21EA7BEA0(self, (uint64_t)a2, (SEL *)&selRef_downloadingError);
}

- (BOOL)isUploading
{
  return sub_21EA7BDC8(self, (uint64_t)a2, (SEL *)&selRef_isUploading);
}

- (BOOL)isUploaded
{
  return sub_21EA7BDC8(self, (uint64_t)a2, (SEL *)&selRef_isUploaded);
}

- (NSProgress)uploadingProgress
{
  return (NSProgress *)sub_21EA7BF38(self, (uint64_t)a2, (SEL *)&selRef_uploadingProgress);
}

- (NSError)uploadingError
{
  return (NSError *)sub_21EA7BEA0(self, (uint64_t)a2, (SEL *)&selRef_uploadingError);
}

- (NSProgress)copyingProgress
{
  return (NSProgress *)sub_21EA7BF38(self, (uint64_t)a2, (SEL *)&selRef_copyingProgress);
}

- (int64_t)localizedStandardTagsCompareNode:(id)a3
{
  return (int64_t)sub_21EA7C088(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_localizedStandardTagsCompareNode_);
}

- (int64_t)_doc_fileTypeCompare:(id)a3
{
  return (int64_t)sub_21EA7C088(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef__doc_fileTypeCompare_);
}

@end
