@implementation _UITextFormattingActionClientToHost

+ (id)actionForChangeValue:(id)a3 textAttributesData:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData bs_secureDataFromObject:](NSData, "bs_secureDataFromObject:", a3));
  v8 = objc_alloc_init((Class)BSMutableSettings);
  objc_msgSend(v8, "setObject:forSetting:", &off_100091760, 0);
  objc_msgSend(v8, "setObject:forSetting:", v6, 6);

  objc_msgSend(v8, "setObject:forSetting:", v7, 1);
  v9 = objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v8, 0);

  return v9;
}

+ (id)actionForPresentColorPickerWithRect:(CGRect)a3 selectedColor:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData bs_secureDataFromObject:](NSData, "bs_secureDataFromObject:", a4));
  v10 = objc_alloc_init((Class)BSMutableSettings);
  objc_msgSend(v10, "setObject:forSetting:", &off_100091778, 0);
  objc_msgSend(v10, "setObject:forSetting:", v9, 3);
  *(CGFloat *)v14 = x;
  *(CGFloat *)&v14[1] = y;
  *(CGFloat *)&v14[2] = width;
  *(CGFloat *)&v14[3] = height;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v14, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
  objc_msgSend(v10, "setObject:forSetting:", v11, 2);

  v12 = objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v10, 0);
  return v12;
}

+ (id)actionForPresentFontPickerWithConfiguration:(id)a3 selectedFonts:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData bs_secureDataFromObject:](NSData, "bs_secureDataFromObject:", a4));
  v8 = objc_alloc_init((Class)BSMutableSettings);
  objc_msgSend(v8, "setObject:forSetting:", &off_100091790, 0);
  objc_msgSend(v8, "setObject:forSetting:", v6, 4);

  objc_msgSend(v8, "setObject:forSetting:", v7, 5);
  v9 = objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v8, 0);

  return v9;
}

+ (id)actionForPresentTypographySettingsForFont:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData bs_secureDataFromObject:](NSData, "bs_secureDataFromObject:", a3));
  v5 = objc_alloc_init((Class)BSMutableSettings);
  objc_msgSend(v5, "setObject:forSetting:", &off_1000917A8, 0);
  objc_msgSend(v5, "setObject:forSetting:", v4, 5);
  v6 = objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v5, 0);

  return v6;
}

+ (id)actionForDidFinish
{
  id v3;
  id v4;

  v3 = objc_alloc_init((Class)BSMutableSettings);
  objc_msgSend(v3, "setObject:forSetting:", &off_1000917C0, 0);
  v4 = objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v3, 0);

  return v4;
}

- (void)performActionForSceneController:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  NSSet *v27;
  void *v28;
  void *v29;
  void *v30;
  NSSet *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "delegate"));
  if ((objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL____UITextFormattingRemoteViewControllerHost) & 1) == 0)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextFormattingActionClientToHost.m"), 95, CFSTR("Scene controller's delegate (%@) does not conform to _UITextFormattingRemoteViewControllerHost"), objc_opt_class(v5));

  }
  v35 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_UITextFormattingActionClientToHost info](self, "info"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForSetting:", 0));
  v8 = objc_msgSend(v7, "integerValue");

  switch((unint64_t)v8)
  {
    case 0uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[_UITextFormattingActionClientToHost info](self, "info"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForSetting:", 1));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UITextFormattingViewControllerChangeValue bs_secureDecodedFromData:](UITextFormattingViewControllerChangeValue, "bs_secureDecodedFromData:", v10));

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[_UITextFormattingActionClientToHost info](self, "info"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForSetting:", 6));

      objc_msgSend(v35, "_textFormattingDidChangeValue:textAttributesData:", v11, v13);
      goto LABEL_9;
    case 1uLL:
      objc_msgSend(v35, "_textFormattingDidFinish");
      break;
    case 2uLL:
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[_UITextFormattingActionClientToHost info](self, "info"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForSetting:", 3));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bs_secureDecodedFromData:](UIColor, "bs_secureDecodedFromData:", v15));

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[_UITextFormattingActionClientToHost info](self, "info"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForSetting:", 2));
      objc_msgSend(v17, "CGRectValue");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;

      objc_msgSend(v35, "_presentColorPicker:selectedColor:", v11, v19, v21, v23, v25);
      goto LABEL_10;
    case 3uLL:
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[_UITextFormattingActionClientToHost info](self, "info"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForSetting:", 4));

      v27 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(UIFont));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[_UITextFormattingActionClientToHost info](self, "info"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForSetting:", 5));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray bs_secureDecodedFromData:withAdditionalClasses:](NSArray, "bs_secureDecodedFromData:withAdditionalClasses:", v29, v13));

      objc_msgSend(v35, "_presentFontPickerWithConfiguration:selectedFonts:", v11, v30);
      goto LABEL_9;
    case 4uLL:
      v31 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(UIFont));
      v11 = (void *)objc_claimAutoreleasedReturnValue(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[_UITextFormattingActionClientToHost info](self, "info"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForSetting:", 5));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont bs_secureDecodedFromData:withAdditionalClasses:](UIFont, "bs_secureDecodedFromData:withAdditionalClasses:", v33, v11));

      objc_msgSend(v35, "_presentTypographySettingsForFont:", v13);
LABEL_9:

LABEL_10:
      break;
    default:
      break;
  }

}

@end
