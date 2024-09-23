@implementation ColorOptions

+ (id)colorOptionsWithStarting:(id)a3 success:(id)a4 failed:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithStarting:success:failed:", v10, v9, v8);

  return v11;
}

- (ColorOptions)initWithStarting:(id)a3 success:(id)a4 failed:(id)a5
{
  id v9;
  id v10;
  id v11;
  ColorOptions *v12;
  ColorOptions *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ColorOptions;
  v12 = -[ColorOptions init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_starting, a3);
    objc_storeStrong((id *)&v13->_success, a4);
    objc_storeStrong((id *)&v13->_failed, a5);
  }

  return v13;
}

- (ColorOptions)init
{
  void *v3;
  void *v4;
  void *v5;
  ColorOptions *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithHexValue:error:](UIColor, "colorWithHexValue:error:", CFSTR("2094FA"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithHexValue:error:](UIColor, "colorWithHexValue:error:", CFSTR("04DE71"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithHexValue:error:](UIColor, "colorWithHexValue:error:", CFSTR("FF3B30"), 0));
  v6 = -[ColorOptions initWithStarting:success:failed:](self, "initWithStarting:success:failed:", v3, v4, v5);

  return v6;
}

- (UIColor)starting
{
  return self->_starting;
}

- (void)setStarting:(id)a3
{
  objc_storeStrong((id *)&self->_starting, a3);
}

- (UIColor)success
{
  return self->_success;
}

- (void)setSuccess:(id)a3
{
  objc_storeStrong((id *)&self->_success, a3);
}

- (UIColor)failed
{
  return self->_failed;
}

- (void)setFailed:(id)a3
{
  objc_storeStrong((id *)&self->_failed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_success, 0);
  objc_storeStrong((id *)&self->_starting, 0);
}

@end
