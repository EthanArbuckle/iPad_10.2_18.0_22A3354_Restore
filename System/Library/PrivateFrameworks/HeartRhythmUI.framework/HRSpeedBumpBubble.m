@implementation HRSpeedBumpBubble

- (HRSpeedBumpBubble)initWithTitle:(id)a3 description:(id)a4
{
  id v7;
  id v8;
  HRSpeedBumpBubble *v9;
  HRSpeedBumpBubble *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HRSpeedBumpBubble;
  v9 = -[HRSpeedBumpBubble init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_body, a4);
  }

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)body
{
  return self->_body;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
