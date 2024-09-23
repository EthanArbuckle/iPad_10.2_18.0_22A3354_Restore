@implementation INParameterImage

- (INParameterImage)initWithParameter:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  INParameterImage *v8;
  uint64_t v9;
  INParameter *parameter;
  uint64_t v11;
  INImage *image;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INParameterImage;
  v8 = -[INParameterImage init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    parameter = v8->_parameter;
    v8->_parameter = (INParameter *)v9;

    v11 = objc_msgSend(v7, "copy");
    image = v8->_image;
    v8->_image = (INImage *)v11;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  INParameterImage *v5;
  id v6;
  id v7;
  INParameterImage *v8;

  v5 = [INParameterImage alloc];
  v6 = -[INParameter copyWithZone:](self->_parameter, "copyWithZone:", a3);
  v7 = -[INImage copyWithZone:](self->_image, "copyWithZone:", a3);
  v8 = -[INParameterImage initWithParameter:image:](v5, "initWithParameter:image:", v6, v7);

  return v8;
}

- (INParameter)parameter
{
  return self->_parameter;
}

- (INImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_parameter, 0);
}

@end
