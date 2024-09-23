@implementation BNBannerSourcePresentableSpecification

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  __int128 v5;
  void *v6;
  _OWORD v7[2];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BNBannerSourcePresentableSpecification;
  v4 = a3;
  -[BNPresentableIdentification encodeWithBSXPCCoder:](&v8, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_contentBehavior, CFSTR("contentBehavior"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_presentableBehavior, CFSTR("presentableBehavior"));
  objc_msgSend(v4, "encodeCGSize:forKey:", CFSTR("preferredContentSize"), self->_preferredContentSize.width, self->_preferredContentSize.height);
  v5 = *(_OWORD *)&self->_contentOutsets.bottom;
  v7[0] = *(_OWORD *)&self->_contentOutsets.top;
  v7[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v7, "{UIEdgeInsets=dddd}");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("contentOutsets"));

}

- (BNBannerSourcePresentableSpecification)initWithBSXPCCoder:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BNBannerSourcePresentableSpecification;
  v5 = -[BNPresentableIdentification initWithBSXPCCoder:](&v17, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    *((_QWORD *)v5 + 4) = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("contentBehavior"));
    *((_QWORD *)v5 + 5) = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("presentableBehavior"));
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("preferredContentSize"));
    *((_QWORD *)v5 + 6) = v6;
    *((_QWORD *)v5 + 7) = v7;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentOutsets"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = v5 + 64;
    if (v8)
    {
      objc_msgSend(v8, "UIEdgeInsetsValue");
      *v10 = v11;
      *((_QWORD *)v5 + 9) = v12;
      *((_QWORD *)v5 + 10) = v13;
      *((_QWORD *)v5 + 11) = v14;
    }
    else
    {
      v15 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
      *(_OWORD *)v10 = *MEMORY[0x1E0CEB4B0];
      *((_OWORD *)v5 + 5) = v15;
    }

  }
  return (BNBannerSourcePresentableSpecification *)v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t contentBehavior;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BNBannerSourcePresentableSpecification;
  -[BNPresentableIdentification description](&v13, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)MEMORY[0x1E0CB3940];
  contentBehavior = self->_contentBehavior;
  if (contentBehavior > 2)
    v7 = CFSTR("[invalid]");
  else
    v7 = off_1E7044BC8[contentBehavior];
  BNStringFromBNPresentableBehavior(self->_presentableBehavior);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(self->_preferredContentSize);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromUIEdgeInsets(self->_contentOutsets);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("; contentBehavior: %@; presentableType: %@; preferredContentSize: %@; contentOutsets: %@>"),
    v7,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertString:atIndex:", v11, objc_msgSend(v4, "rangeOfString:options:", CFSTR(">"), 12));

  return (NSString *)v4;
}

- (int64_t)contentBehavior
{
  return self->_contentBehavior;
}

- (void)setContentBehavior:(int64_t)a3
{
  self->_contentBehavior = a3;
}

- (int64_t)presentableBehavior
{
  return self->_presentableBehavior;
}

- (void)setPresentableBehavior:(int64_t)a3
{
  self->_presentableBehavior = a3;
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  self->_preferredContentSize = a3;
}

- (UIEdgeInsets)contentOutsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentOutsets.top;
  left = self->_contentOutsets.left;
  bottom = self->_contentOutsets.bottom;
  right = self->_contentOutsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentOutsets:(UIEdgeInsets)a3
{
  self->_contentOutsets = a3;
}

@end
