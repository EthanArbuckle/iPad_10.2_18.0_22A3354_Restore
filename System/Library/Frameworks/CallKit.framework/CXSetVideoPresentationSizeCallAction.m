@implementation CXSetVideoPresentationSizeCallAction

- (CXSetVideoPresentationSizeCallAction)initWithCallUUID:(id)a3 videoPresentationSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  CXSetVideoPresentationSizeCallAction *result;
  objc_super v7;

  height = a4.height;
  width = a4.width;
  v7.receiver = self;
  v7.super_class = (Class)CXSetVideoPresentationSizeCallAction;
  result = -[CXCallAction initWithCallUUID:](&v7, sel_initWithCallUUID_, a3);
  if (result)
  {
    result->_videoPresentationSize.width = width;
    result->_videoPresentationSize.height = height;
  }
  return result;
}

- (id)customDescription
{
  void *v3;
  void *v4;
  objc_super v6;
  NSSize v7;

  v6.receiver = self;
  v6.super_class = (Class)CXSetVideoPresentationSizeCallAction;
  -[CXCallAction customDescription](&v6, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXSetVideoPresentationSizeCallAction videoPresentationSize](self, "videoPresentationSize");
  NSStringFromSize(v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" videoPresentationSize=%@"), v4);

  return v3;
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXSetVideoPresentationSizeCallAction;
  v6 = a3;
  -[CXAction updateCopy:withZone:](&v7, sel_updateCopy_withZone_, v6, a4);
  -[CXSetVideoPresentationSizeCallAction videoPresentationSize](self, "videoPresentationSize", v7.receiver, v7.super_class);
  objc_msgSend(v6, "setVideoPresentationSize:");

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetVideoPresentationSizeCallAction)initWithCoder:(id)a3
{
  id v4;
  CXSetVideoPresentationSizeCallAction *v5;
  CXSetVideoPresentationSizeCallAction *v6;
  CGSize *p_videoPresentationSize;
  void *v8;
  objc_class *v9;
  CGFloat v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CXSetVideoPresentationSizeCallAction;
  v5 = -[CXCallAction initWithCoder:](&v12, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    p_videoPresentationSize = &v5->_videoPresentationSize;
    NSStringFromSelector(sel_videoPresentationSize);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeSizeForKey:", v8);
    *(_QWORD *)&p_videoPresentationSize->width = v9;
    v6->_videoPresentationSize.height = v10;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CXSetVideoPresentationSizeCallAction;
  v4 = a3;
  -[CXCallAction encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[CXSetVideoPresentationSizeCallAction videoPresentationSize](self, "videoPresentationSize", v10.receiver, v10.super_class);
  v6 = v5;
  v8 = v7;
  NSStringFromSelector(sel_videoPresentationSize);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeSize:forKey:", v9, v6, v8);

}

- (CGSize)videoPresentationSize
{
  double width;
  double height;
  CGSize result;

  width = self->_videoPresentationSize.width;
  height = self->_videoPresentationSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setVideoPresentationSize:(CGSize)a3
{
  self->_videoPresentationSize = a3;
}

@end
