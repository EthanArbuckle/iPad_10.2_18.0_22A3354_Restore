@implementation PKPaletteTooltipPresentationHandle

- (PKPaletteTooltipPresentationHandle)initWithHostingView:(id)a3
{
  id v4;
  PKPaletteTooltipPresentationHandle *v5;
  PKPaletteTooltipPresentationHandle *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaletteTooltipPresentationHandle;
  v5 = -[PKPaletteTooltipPresentationHandle init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_hostingView, v4);

  return v6;
}

- (void)showWithText:(id)a3 fromView:(id)a4 rect:(CGRect)a5 atEdge:(unint64_t)a6 offset:(double)a7 traitCollection:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id WeakRetained;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double MidX;
  double MidY;
  UIView *v26;
  UIView *floatingLabel;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double MinY;
  double v38;
  CGFloat v39;
  CGFloat v40;
  double MinX;
  CGFloat v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  id v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v56 = a3;
  v17 = a4;
  v18 = a8;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_hideFloatingLabel, 0);
  -[PKPaletteTooltipPresentationHandle hideFloatingLabel](self, "hideFloatingLabel");
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostingView);
  if (WeakRetained)
  {
    v57.origin.x = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v17, WeakRetained, x, y, width, height);
    v20 = v57.origin.x;
    v21 = v57.origin.y;
    v22 = v57.size.width;
    v23 = v57.size.height;
    MidX = CGRectGetMidX(v57);
    v58.origin.x = v20;
    v58.origin.y = v21;
    v58.size.width = v22;
    v58.size.height = v23;
    MidY = CGRectGetMidY(v58);
    +[PKFloatingLabelView floatingLabelViewWithString:font:location:traitCollection:](MidX, MidY, (uint64_t)PKFloatingLabelView, v56, 0, v18);
    v26 = (UIView *)objc_claimAutoreleasedReturnValue();
    floatingLabel = self->_floatingLabel;
    self->_floatingLabel = v26;

    -[UIView frame](self->_floatingLabel, "frame");
    v30 = v28;
    v31 = v28;
    v32 = v29;
    v54 = v33;
    v55 = v34;
    v35 = v29;
    switch(a6)
    {
      case 1uLL:
        v59.origin.x = v20;
        v50 = v30;
        v52 = v29;
        v59.origin.y = v21;
        v59.size.width = v22;
        v59.size.height = v23;
        v49 = CGRectGetMidX(v59);
        v60.origin.x = v20;
        v60.origin.y = v21;
        v60.size.width = v22;
        v60.size.height = v23;
        v35 = CGRectGetMaxY(v60) + a7;
        v61.origin.x = v31;
        v61.origin.y = v32;
        v61.size.width = v54;
        v61.size.height = v55;
        v36 = CGRectGetMidX(v61);
        v62.origin.x = v31;
        v62.origin.y = v32;
        v62.size.width = v54;
        v62.size.height = v55;
        MinY = CGRectGetMinY(v62);
        goto LABEL_6;
      case 2uLL:
        v63.origin.x = v20;
        v51 = v30;
        v53 = v29;
        v63.origin.y = v21;
        v63.size.width = v22;
        v63.size.height = v23;
        v38 = CGRectGetMaxX(v63) + a7;
        v64.origin.x = v20;
        v64.origin.y = v21;
        v64.size.width = v22;
        v64.size.height = v23;
        v35 = CGRectGetMidY(v64);
        v65.origin.x = v31;
        v65.origin.y = v32;
        v40 = v54;
        v39 = v55;
        v65.size.width = v54;
        v65.size.height = v55;
        MinX = CGRectGetMinX(v65);
        goto LABEL_8;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        break;
      case 4uLL:
        v66.origin.x = v20;
        v50 = v30;
        v52 = v29;
        v66.origin.y = v21;
        v66.size.width = v22;
        v66.size.height = v23;
        v49 = CGRectGetMidX(v66);
        v67.origin.x = v20;
        v67.origin.y = v21;
        v67.size.width = v22;
        v67.size.height = v23;
        v35 = CGRectGetMinY(v67) - a7;
        v68.origin.x = v31;
        v68.origin.y = v32;
        v68.size.width = v54;
        v68.size.height = v55;
        v36 = CGRectGetMidX(v68);
        v69.origin.x = v31;
        v69.origin.y = v32;
        v69.size.width = v54;
        v69.size.height = v55;
        MinY = CGRectGetMaxY(v69);
LABEL_6:
        v30 = v50;
        v29 = v52;
        v32 = MinY;
        v28 = v49;
        goto LABEL_9;
      case 8uLL:
        v70.origin.x = v20;
        v51 = v30;
        v53 = v29;
        v70.origin.y = v21;
        v70.size.width = v22;
        v70.size.height = v23;
        v38 = CGRectGetMinX(v70) - a7;
        v71.origin.x = v20;
        v71.origin.y = v21;
        v71.size.width = v22;
        v71.size.height = v23;
        v35 = CGRectGetMidY(v71);
        v72.origin.x = v31;
        v72.origin.y = v32;
        v40 = v54;
        v39 = v55;
        v72.size.width = v54;
        v72.size.height = v55;
        MinX = CGRectGetMaxX(v72);
LABEL_8:
        v36 = MinX;
        v73.origin.x = v31;
        v73.origin.y = v32;
        v73.size.width = v40;
        v73.size.height = v39;
        v42 = CGRectGetMidY(v73);
        v30 = v51;
        v29 = v53;
        v32 = v42;
        v28 = v38;
LABEL_9:
        v31 = v36;
        break;
      default:
        v35 = v29;
        break;
    }
    v43 = v30 + v28 - v31;
    v44 = v29 + v35 - v32;
    objc_msgSend(WeakRetained, "bounds", *(_QWORD *)&v49);
    -[UIView setFrame:](self->_floatingLabel, "setFrame:", DKDUpdateFixedSizeRectToFitInsideRectIfPossible(v43, v44, v54, v55, v45, v46, v47, v48));
    objc_msgSend(WeakRetained, "addSubview:", self->_floatingLabel);
    -[PKPaletteTooltipPresentationHandle performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_hideFloatingLabel, 0, 1.0);
  }

}

- (void)hideFloatingLabel
{
  UIView *floatingLabel;

  -[UIView removeFromSuperview](self->_floatingLabel, "removeFromSuperview");
  floatingLabel = self->_floatingLabel;
  self->_floatingLabel = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingLabel, 0);
  objc_destroyWeak((id *)&self->_hostingView);
}

@end
