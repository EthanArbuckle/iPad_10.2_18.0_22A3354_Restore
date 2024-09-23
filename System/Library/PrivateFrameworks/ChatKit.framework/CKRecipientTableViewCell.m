@implementation CKRecipientTableViewCell

+ (id)cellForRecipient:(id)a3
{
  id v4;
  CKRecipientTableViewCell *v5;
  void *v6;
  CKRecipientTableViewCell *v7;

  v4 = a3;
  v5 = [CKRecipientTableViewCell alloc];
  +[MFRecipientTableViewCell identifier](CKRecipientTableViewCell, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CKRecipientTableViewCell initWithStyle:reuseIdentifier:](v5, "initWithStyle:reuseIdentifier:", 0, v6);

  if (v7)
    objc_storeStrong((id *)((char *)&v7->super.super.super.super.super.isa + (int)*MEMORY[0x1E0CC6908]), a3);

  return v7;
}

- (CKRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKRecipientTableViewCell *v4;
  CKRecipientTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKRecipientTableViewCell;
  v4 = -[MFRecipientTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[MFRecipientTableViewCell setOpaque:](v4, "setOpaque:", 0);
  return v5;
}

- (void)setServiceColor:(char)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a4;
  v5 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "theme");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "recipientTextColorForColorType:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[MFRecipientTableViewCell tintColor](self, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v9, "isEqual:", v10);

  if ((v8 & 1) == 0)
  {
    -[MFRecipientTableViewCell setShouldDimIrrelevantInformation:](self, "setShouldDimIrrelevantInformation:", (_DWORD)v5 == -1);
    -[MFRecipientTableViewCell setTintColor:animated:](self, "setTintColor:animated:", v10, v4);
  }

}

@end
