@implementation AMUIInfographListLayoutProvider

- (AMUIInfographListLayoutProvider)init
{
  return -[AMUIInfographListLayoutProvider initWithScreenType:](self, "initWithScreenType:", SBHScreenTypeForCurrentDevice());
}

- (AMUIInfographListLayoutProvider)initWithScreenType:(unint64_t)a3
{
  AMUIInfographListLayoutProvider *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMUIInfographListLayoutProvider;
  result = -[AMUIInfographListLayoutProvider init](&v5, sel_init);
  if (result)
    result->_screenType = a3;
  return result;
}

- (id)layoutForIconLocation:(id)a3
{
  id v4;
  AMUIInfographIconListLayout *v5;

  v4 = objc_alloc_init(MEMORY[0x24BEB0910]);
  -[AMUIInfographListLayoutProvider configureRootFolderConfiguration:screenType:](self, "configureRootFolderConfiguration:screenType:", v4, self->_screenType);
  v5 = -[AMUIInfographIconListLayout initWithRootFolderVisualConfiguration:screenType:]([AMUIInfographIconListLayout alloc], "initWithRootFolderVisualConfiguration:screenType:", v4, self->_screenType);

  return v5;
}

- (void)configureRootFolderConfiguration:(id)a3 screenType:(unint64_t)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;

  v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 0uLL:
    case 1uLL:
      v8 = 2.0;
      v9 = 3.0;
      goto LABEL_13;
    case 2uLL:
      v8 = 5.0;
      v9 = 6.0;
LABEL_13:
      objc_msgSend(v6, "setEditModeButtonLayoutOffset:", v8, v9);
      v15 = 50.0;
      v16 = 24.0;
      break;
    case 3uLL:
    case 6uLL:
    case 8uLL:
      goto LABEL_11;
    case 4uLL:
      v10 = 10.0;
      v18 = 10.0;
      goto LABEL_29;
    case 5uLL:
    case 7uLL:
      v10 = 28.0;
      goto LABEL_28;
    case 9uLL:
      objc_msgSend(v6, "setEditModeButtonLayoutOffset:", 14.0, 19.0);
      v19 = 0x404D000000000000;
      goto LABEL_30;
    case 0xAuLL:
      objc_msgSend(v6, "setEditModeButtonLayoutOffset:", 10.0, 10.0);
      v19 = 0x404A000000000000;
      goto LABEL_30;
    case 0xBuLL:
      v10 = 20.0;
      goto LABEL_24;
    case 0xCuLL:
      v10 = 13.0;
      goto LABEL_28;
    case 0xDuLL:
      v11 = 30.0;
      v12 = 20.0;
      goto LABEL_20;
    case 0xEuLL:
      v20 = 22.0;
      v21 = 20.0;
      goto LABEL_26;
    case 0xFuLL:
      objc_msgSend(v6, "setEditModeButtonLayoutOffset:", 25.0, 19.0);
      v19 = 0x4050000000000000;
      goto LABEL_30;
    case 0x10uLL:
      v10 = 16.0;
LABEL_24:
      v18 = 18.0;
      goto LABEL_29;
    case 0x11uLL:
      v20 = 30.0;
      v21 = 18.0;
LABEL_26:
      objc_msgSend(v6, "setEditModeButtonLayoutOffset:", v20, v21);
      v15 = 66.0;
      goto LABEL_31;
    case 0x12uLL:
      v10 = 18.0;
      goto LABEL_28;
    case 0x13uLL:
      v13 = 42.0;
      v14 = 23.0;
      goto LABEL_34;
    case 0x14uLL:
      v13 = 28.0;
      v14 = 20.0;
      goto LABEL_34;
    case 0x15uLL:
    case 0x19uLL:
      v11 = 37.0;
      v12 = 16.0;
      goto LABEL_20;
    case 0x16uLL:
    case 0x1AuLL:
      v11 = 25.0;
      v12 = 10.0;
LABEL_20:
      objc_msgSend(v6, "setEditModeButtonLayoutOffset:", v11, v12);
      v15 = 66.0;
      goto LABEL_35;
    case 0x17uLL:
    case 0x1BuLL:
      v13 = 50.0;
      v14 = 16.0;
LABEL_34:
      objc_msgSend(v6, "setEditModeButtonLayoutOffset:", v13, v14);
      v15 = 68.0;
LABEL_35:
      v16 = 28.0;
      break;
    case 0x18uLL:
    case 0x1CuLL:
      objc_msgSend(v6, "setEditModeButtonLayoutOffset:", 40.0, 12.0);
      v15 = 68.0;
      v16 = 27.0;
      break;
    default:
      AMUILogInfograph();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[AMUIInfographListLayoutProvider configureRootFolderConfiguration:screenType:].cold.1((uint64_t)self, v17);

LABEL_11:
      v10 = 16.0;
LABEL_28:
      v18 = 16.0;
LABEL_29:
      objc_msgSend(v7, "setEditModeButtonLayoutOffset:", v10, v18);
      v19 = 0x404E000000000000;
LABEL_30:
      v15 = *(double *)&v19;
LABEL_31:
      v16 = 26.0;
      break;
  }
  objc_msgSend(v7, "setEditModeButtonSize:", v15, v16);
  objc_msgSend(v7, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);

}

- (unint64_t)screenType
{
  return self->_screenType;
}

- (void)configureRootFolderConfiguration:(uint64_t)a1 screenType:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  SBHStringForScreenType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_23600A000, a2, OS_LOG_TYPE_ERROR, "Requesting root folder visual configuration for unexpected screen type: %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
