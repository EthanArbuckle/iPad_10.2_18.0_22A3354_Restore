@implementation ABPKAlgorithmState

- (ABPKAlgorithmState)init
{
  ABPKAlgorithmState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABPKAlgorithmState;
  result = -[ABPKAlgorithmState init](&v3, sel_init);
  *(_DWORD *)&result->_image_preprocessing = 0;
  result->_retargeting = 0;
  return result;
}

- (id)toDict
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_image_preprocessing);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("image_preprocessing"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_detection2d);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("detection2d"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_lifting3d);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("lifting3d"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_registration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("registration"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_retargeting);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("retargeting"));

  return v3;
}

- (BOOL)image_preprocessing
{
  return self->_image_preprocessing;
}

- (void)setImage_preprocessing:(BOOL)a3
{
  self->_image_preprocessing = a3;
}

- (BOOL)detection2d
{
  return self->_detection2d;
}

- (void)setDetection2d:(BOOL)a3
{
  self->_detection2d = a3;
}

- (BOOL)lifting3d
{
  return self->_lifting3d;
}

- (void)setLifting3d:(BOOL)a3
{
  self->_lifting3d = a3;
}

- (BOOL)registration
{
  return self->_registration;
}

- (void)setRegistration:(BOOL)a3
{
  self->_registration = a3;
}

- (BOOL)retargeting
{
  return self->_retargeting;
}

- (void)setRetargeting:(BOOL)a3
{
  self->_retargeting = a3;
}

@end
