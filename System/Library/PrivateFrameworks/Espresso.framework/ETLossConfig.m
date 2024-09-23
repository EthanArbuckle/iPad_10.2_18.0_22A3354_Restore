@implementation ETLossConfig

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (NSString)loss_name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLoss_name:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)output_name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOutput_name:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)label_name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLabel_name:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)label_shape
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLabel_shape:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)custom_network_path
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCustom_network_path:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_custom_network_path, 0);
  objc_storeStrong((id *)&self->_label_shape, 0);
  objc_storeStrong((id *)&self->_label_name, 0);
  objc_storeStrong((id *)&self->_output_name, 0);
  objc_storeStrong((id *)&self->_loss_name, 0);
}

+ (id)softmaxCrossEntropyLoss
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setMode:", 1);
  return v2;
}

+ (id)L2Loss
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setMode:", 2);
  return v2;
}

@end
