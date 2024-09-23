@implementation PKToolFromPaletteTool

+ (id)toolByApplyingPropertiesFromPaletteTool:(id)a3 toTool:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  PKEraserTool *v11;
  PKEraserTool *v12;
  void *v13;
  PKHandwritingTool *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v20;
  uint8_t v21[16];

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "_configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  if (objc_msgSend(v5, "isInkingTool")
    && (objc_msgSend(v5, "isLassoTool") & 1) == 0
    && (objc_msgSend(v5, "isCustomTool") & 1) == 0)
  {
    objc_msgSend(v5, "inkingTool");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ink");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PKTool _initWithInk:configuration:]([PKInkingTool alloc], "_initWithInk:configuration:", v13, v8);
    objc_msgSend(v6, "_toolPickerItemIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTool _setToolPickerItemIdentifier:](v12, "_setToolPickerItemIdentifier:", v15);
    goto LABEL_13;
  }
  if (!objc_msgSend(v5, "isErasingTool"))
  {
    if (objc_msgSend(v5, "isLassoTool"))
    {
      objc_msgSend(v5, "inkingTool");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ink");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PKLassoTool _initWithInk:]([PKLassoTool alloc], "_initWithInk:", v13);
LABEL_14:

      goto LABEL_15;
    }
    if (objc_msgSend(v5, "isHandwritingTool"))
    {
      v14 = objc_alloc_init(PKHandwritingTool);
LABEL_20:
      v12 = (PKEraserTool *)v14;
      goto LABEL_16;
    }
    if (!objc_msgSend(v5, "isCustomTool"))
    {
      v20 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v21 = 0;
        _os_log_error_impl(&dword_1BE213000, v20, OS_LOG_TYPE_ERROR, "Unsupported tool type.", v21, 2u);
      }

      v14 = (PKHandwritingTool *)v6;
      goto LABEL_20;
    }
    v16 = objc_opt_class();
    PKCheckedDynamicCast(v16, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inkingTool");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ink");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "color");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v9, "copyWithScrubbedColor:", v17);

    objc_msgSend(v15, "weight");
    v12 = (PKEraserTool *)objc_msgSend(v18, "copyWithWeight:");

LABEL_13:
    goto LABEL_14;
  }
  objc_msgSend(v5, "erasingTool");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isBitmapEraser");
  v11 = [PKEraserTool alloc];
  objc_msgSend(v9, "weight");
  v12 = -[PKEraserTool initWithEraserType:weight:](v11, "initWithEraserType:weight:", v10);
LABEL_15:

LABEL_16:
  return v12;
}

@end
