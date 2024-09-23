@implementation IDSTapToRadarRequest

- (IDSTapToRadarRequest)initWithTitle:(id)a3 message:(id)a4
{
  id v7;
  id v8;
  IDSTapToRadarRequest *v9;
  IDSTapToRadarRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSTapToRadarRequest;
  v9 = -[IDSTapToRadarRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_message, a4);
  }

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
