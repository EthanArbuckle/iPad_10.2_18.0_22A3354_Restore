@implementation IdentityProofingDocumentSubmissionTableViewCell

- (_TtC9CoreIDVUI47IdentityProofingDocumentSubmissionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_213FF9458();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC9CoreIDVUI47IdentityProofingDocumentSubmissionTableViewCell *)sub_213FA0828(a3, (uint64_t)a4, v6);
}

- (_TtC9CoreIDVUI47IdentityProofingDocumentSubmissionTableViewCell)initWithCoder:(id)a3
{
  return (_TtC9CoreIDVUI47IdentityProofingDocumentSubmissionTableViewCell *)sub_213FA0924(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingDocumentSubmissionTableViewCell____lazy_storage___documentImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingDocumentSubmissionTableViewCell____lazy_storage___documentTitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingDocumentSubmissionTableViewCell____lazy_storage___imageContainer));
}

@end
