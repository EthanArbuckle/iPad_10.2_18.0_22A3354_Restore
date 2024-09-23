@implementation PassWrapper

- (PassWrapper)initWithUniquePassID:(id)a3
{
  id v4;
  PassWrapper *v5;
  void *v6;
  uint64_t v7;
  PKPass *pass;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PassWrapper;
  v5 = -[PassWrapper init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE6EC00], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "passWithUniqueID:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    pass = v5->_pass;
    v5->_pass = (PKPass *)v7;

  }
  return v5;
}

- (id)croppedImageToAlignmentRectInsets:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v3 = a3;
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "alignmentRectInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD618]), "initWithSize:", v5 - v10 - v14, v7 - v8 - v12);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __49__PassWrapper_croppedImageToAlignmentRectInsets___block_invoke;
  v20[3] = &unk_24D116E18;
  v21 = v3;
  v22 = v9;
  v23 = v11;
  v24 = v13;
  v25 = v15;
  v17 = v3;
  objc_msgSend(v16, "imageWithActions:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __49__PassWrapper_croppedImageToAlignmentRectInsets___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", -*(double *)(a1 + 48), -*(double *)(a1 + 40));
}

- (id)getPassImageWithSize:(CGSize)a3
{
  double height;
  double width;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  height = a3.height;
  width = a3.width;
  DVUI_LOG_CLIENT();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[PassWrapper getPassImageWithSize:].cold.4();

  if (self->_pass)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v7 = (void *)getPKPassViewClass_softClass;
    v19 = getPKPassViewClass_softClass;
    if (!getPKPassViewClass_softClass)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __getPKPassViewClass_block_invoke;
      v15[3] = &unk_24D116DC0;
      v15[4] = &v16;
      __getPKPassViewClass_block_invoke((uint64_t)v15);
      v7 = (void *)v17[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v16, 8);
    if (v8)
    {
      v9 = objc_msgSend([v8 alloc], "initWithPass:content:", self->_pass, 5);
      DVUI_LOG_CLIENT();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[PassWrapper getPassImageWithSize:].cold.3();

        -[NSObject snapshotOfFrontFaceWithRequestedSize:](v9, "snapshotOfFrontFaceWithRequestedSize:", width, height);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PassWrapper croppedImageToAlignmentRectInsets:](self, "croppedImageToAlignmentRectInsets:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[PassWrapper getPassImageWithSize:].cold.2();
        v13 = 0;
        v9 = v11;
      }
    }
    else
    {
      DVUI_LOG_CLIENT();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[PassWrapper getPassImageWithSize:].cold.1();
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)getPassName
{
  NSObject *v3;
  PKPass *pass;
  NSObject *v5;
  NSObject *v6;
  void *v7;

  DVUI_LOG_CLIENT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PassWrapper getPassName].cold.3();

  pass = self->_pass;
  DVUI_LOG_CLIENT();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (pass)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PassWrapper getPassName].cold.2();

    -[PKPass localizedDescription](self->_pass, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[PassWrapper getPassName].cold.1();

    v7 = 0;
  }
  return v7;
}

- (PKPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
}

- (void)getPassImageWithSize:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_213F36000, v0, v1, "Error while retrieving getPKPassViewClass, returning nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getPassImageWithSize:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_213F36000, v0, v1, "Error in creating PKPassView.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getPassImageWithSize:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_213F36000, v0, v1, "PassImage was created successfully.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getPassImageWithSize:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_213F36000, v0, v1, "Starting get pass image with size.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getPassName
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_213F36000, v0, v1, "Starting get pass name.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
