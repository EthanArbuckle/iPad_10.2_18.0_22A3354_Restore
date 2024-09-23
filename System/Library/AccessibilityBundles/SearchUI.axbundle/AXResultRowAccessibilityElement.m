@implementation AXResultRowAccessibilityElement

- (AXResultRowAccessibilityElement)initWithAccessibilityContainer:(id)a3 label1:(id)a4 label2:(id)a5 label3:(id)a6
{
  id v11;
  id v12;
  id v13;
  AXResultRowAccessibilityElement *v14;
  AXResultRowAccessibilityElement *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AXResultRowAccessibilityElement;
  v14 = -[AXResultRowAccessibilityElement initWithAccessibilityContainer:](&v17, sel_initWithAccessibilityContainer_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_label1, a4);
    objc_storeStrong((id *)&v15->_label2, a5);
    objc_storeStrong((id *)&v15->_label3, a6);
  }

  return v15;
}

- (CGRect)accessibilityFrame
{
  UIView *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v56;
  double v57;
  double v58;
  double v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  objc_super v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect result;
  CGRect v70;
  CGRect v71;

  -[AXResultRowAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("UITableViewCellAccessibilityElement"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIView safeValueForKey:](v3, "safeValueForKey:", CFSTR("realTableViewCell"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (UIView *)v4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UILabel frame](self->_label1, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[UILabel superview](self->_label1, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertRect:fromView:](v3, "convertRect:fromView:", v13, v6, v8, v10, v12);
    v62 = v15;
    v63 = v14;
    v60 = v17;
    v61 = v16;

    -[UILabel frame](self->_label2, "frame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[UILabel superview](self->_label2, "superview");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertRect:fromView:](v3, "convertRect:fromView:", v26, v19, v21, v23, v25);
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;

    -[UILabel frame](self->_label3, "frame");
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;
    -[UILabel superview](self->_label3, "superview");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertRect:fromView:](v3, "convertRect:fromView:", v43, v36, v38, v40, v42);
    v45 = v44;
    v47 = v46;
    v49 = v48;
    v51 = v50;

    v65.origin.y = v62;
    v65.origin.x = v63;
    v65.size.height = v60;
    v65.size.width = v61;
    v70.origin.x = v28;
    v70.origin.y = v30;
    v70.size.width = v32;
    v70.size.height = v34;
    v66 = CGRectUnion(v65, v70);
    v71.origin.x = v45;
    v71.origin.y = v47;
    v71.size.width = v49;
    v71.size.height = v51;
    v67 = CGRectUnion(v66, v71);
    v68 = UIAccessibilityConvertFrameToScreenCoordinates(v67, v3);
  }
  else
  {
    v64.receiver = self;
    v64.super_class = (Class)AXResultRowAccessibilityElement;
    -[AXResultRowAccessibilityElement accessibilityFrame](&v64, sel_accessibilityFrame);
  }
  x = v68.origin.x;
  y = v68.origin.y;
  width = v68.size.width;
  height = v68.size.height;

  v56 = x;
  v57 = y;
  v58 = width;
  v59 = height;
  result.size.height = v59;
  result.size.width = v58;
  result.origin.y = v57;
  result.origin.x = v56;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label3, 0);
  objc_storeStrong((id *)&self->_label2, 0);
  objc_storeStrong((id *)&self->_label1, 0);
}

@end
