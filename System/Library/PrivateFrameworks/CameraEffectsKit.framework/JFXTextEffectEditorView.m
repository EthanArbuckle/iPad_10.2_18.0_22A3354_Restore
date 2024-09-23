@implementation JFXTextEffectEditorView

- (JFXTextEffectEditorView)initWithFrame:(CGRect)a3 textEditingProperties:(id)a4 textContainer:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  JFXTextEffectEditorView *v21;
  JFXTextEffectEditorView *v22;
  JFXTextEffectEditorTransformView *v23;
  void *v24;
  JFXTextEffectEditorTransformView *v25;
  JFXTextEffectEditorTextView *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  objc_super v69;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v11, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v69.receiver = self;
  v69.super_class = (Class)JFXTextEffectEditorView;
  v21 = -[JFXTextEffectEditorView initWithFrame:](&v69, sel_initWithFrame_, x, y, width, height);
  v22 = v21;
  if (v21)
  {
    -[JFXTextEffectEditorView setTextEditingProperties:](v21, "setTextEditingProperties:", v11);
    if (objc_msgSend(v11, "useFullTransform"))
    {
      v23 = [JFXTextEffectEditorTransformView alloc];
      -[JFXTextEffectEditorView editField](v22, "editField");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[JFXTextEffectEditorTransformView initWithFrame:textView:](v23, "initWithFrame:textView:", v24, v14, v16, v18, v20);
      -[JFXTextEffectEditorView setTransformView:](v22, "setTransformView:", v25);

    }
    else
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v14, v16, v18, v20);
      -[JFXTextEffectEditorView setTransformView:](v22, "setTransformView:", v24);
    }

    v26 = -[JFXTextEffectEditorTextView initWithTextEditingProperties:editorView:textContainer:]([JFXTextEffectEditorTextView alloc], "initWithTextEditingProperties:editorView:textContainer:", v11, v22, v12);
    -[JFXTextEffectEditorView setEditField:](v22, "setEditField:", v26);

    -[JFXTextEffectEditorView transformView](v22, "transformView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXTextEffectEditorView addSubview:](v22, "addSubview:", v27);

    -[JFXTextEffectEditorView transformView](v22, "transformView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXTextEffectEditorView editField](v22, "editField");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v29);

    JFX_getDrawOverlayBoundsOptionsDictionary();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[JFXOverlayEffectDebugViewOptions debugViewOptionsWithDictionary:](JFXOverlayEffectDebugViewOptions, "debugViewOptionsWithDictionary:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXTextEffectEditorView setDebugOptions:](v22, "setDebugOptions:", v31);

    if (JFX_isDrawOverlayBoundsEnabled())
    {
      -[JFXTextEffectEditorView debugOptions](v22, "debugOptions");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "showTextBoundingBoxes");

      if (v33)
      {
        -[JFXTextEffectEditorView transformView](v22, "transformView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "layer");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setBorderWidth:", 2.0);

        objc_msgSend(MEMORY[0x24BDF6950], "magentaColor");
        v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v37 = objc_msgSend(v36, "CGColor");
        -[JFXTextEffectEditorView transformView](v22, "transformView");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "layer");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setBorderColor:", v37);

        -[JFXTextEffectEditorView layer](v22, "layer");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setBorderWidth:", 4.0);

        objc_msgSend(MEMORY[0x24BDF6950], "purpleColor");
        v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v42 = objc_msgSend(v41, "CGColor");
        -[JFXTextEffectEditorView layer](v22, "layer");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setBorderColor:", v42);

        -[JFXTextEffectEditorView debugView](v22, "debugView");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "removeFromSuperview");

        v45 = objc_alloc(MEMORY[0x24BDF6F90]);
        -[JFXTextEffectEditorView frame](v22, "frame");
        v46 = (void *)objc_msgSend(v45, "initWithFrame:");
        -[JFXTextEffectEditorView setDebugView:](v22, "setDebugView:", v46);

        -[JFXTextEffectEditorView debugView](v22, "debugView");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setUserInteractionEnabled:", 0);

        -[JFXTextEffectEditorView debugView](v22, "debugView");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "layer");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setBorderWidth:", 2.0);

        objc_msgSend(MEMORY[0x24BDF6950], "yellowColor");
        v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v51 = objc_msgSend(v50, "CGColor");
        -[JFXTextEffectEditorView debugView](v22, "debugView");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "layer");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setBorderColor:", v51);

        -[JFXTextEffectEditorView transformView](v22, "transformView");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[JFXTextEffectEditorView debugView](v22, "debugView");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "addSubview:", v55);

        objc_msgSend(MEMORY[0x24BDE56D0], "layer");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6950], "grayColor");
        v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v56, "setBorderColor:", objc_msgSend(v57, "CGColor"));

        objc_msgSend(v56, "setBorderWidth:", 3.0);
        objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.25);
        v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v56, "setBackgroundColor:", objc_msgSend(v58, "CGColor"));

        -[JFXTextEffectEditorView debugView](v22, "debugView");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "layer");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "addSublayer:", v56);

        objc_msgSend(MEMORY[0x24BDE56D0], "layer");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
        v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v61, "setBorderColor:", objc_msgSend(v62, "CGColor"));

        objc_msgSend(v61, "setBorderWidth:", 2.0);
        -[JFXTextEffectEditorView debugView](v22, "debugView");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "layer");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "addSublayer:", v61);

      }
    }
    -[JFXTextEffectEditorView textEditingProperties](v22, "textEditingProperties");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXTextEffectEditorView applyTextEditingProperties:](v22, "applyTextEditingProperties:", v65);

    v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AF8]), "initWithDelegate:", v22);
    -[JFXTextEffectEditorView addInteraction:](v22, "addInteraction:", v66);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXTextEffectEditorView setPencilTextEditingElementID:](v22, "setPencilTextEditingElementID:", v67);

  }
  return v22;
}

- (JFXTextEffectEditorView)initWithFrame:(CGRect)a3 textEditingProperties:(id)a4
{
  return -[JFXTextEffectEditorView initWithFrame:textEditingProperties:textContainer:](self, "initWithFrame:textEditingProperties:textContainer:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)applyTextEditingProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  v4 = a3;
  -[JFXTextEffectEditorView setTextEditingProperties:](self, "setTextEditingProperties:", v4);
  -[JFXTextEffectEditorView editField](self, "editField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyTextEditingProperties:", v4);

  if (JFX_isDrawOverlayBoundsEnabled())
  {
    -[JFXTextEffectEditorView debugOptions](self, "debugOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "showTextBoundingBoxes");

    if (v7)
    {
      -[JFXTextEffectEditorView editField](self, "editField");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textFrameWithoutFudge");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      -[JFXTextEffectEditorView debugView](self, "debugView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

      -[JFXTextEffectEditorView editField](self, "editField");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "frame");
      v20 = v19;
      v22 = v21;

      v24 = *MEMORY[0x24BDBEFB0];
      v23 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      -[JFXTextEffectEditorView debugView](self, "debugView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "layer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "sublayers");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setFrame:", v24, v23, v20, v22);

      -[JFXTextEffectEditorView editField](self, "editField");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "textContainerInset");
      v31 = v30;
      v33 = v32;
      v35 = v34;
      v37 = v36;

      -[JFXTextEffectEditorView debugView](self, "debugView");
      v41 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "layer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "sublayers");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setFrame:", v24 + v33, v23 + v31, v20 - (v33 + v37), v22 - (v31 + v35));

    }
  }
}

- (void)selectAll
{
  id v2;

  -[JFXTextEffectEditorView editField](self, "editField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectAll:", 0);

}

- (void)endEditing
{
  id v2;

  -[JFXTextEffectEditorView editField](self, "editField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignFirstResponder");

}

- (NSString)text
{
  void *v2;
  void *v3;

  -[JFXTextEffectEditorView editField](self, "editField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)indirectScribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  _QWORD v13[2];
  CGRect v14;
  CGRect v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13[1] = *MEMORY[0x24BDAC8D0];
  v10 = (void (**)(id, void *))a5;
  -[JFXTextEffectEditorView bounds](self, "bounds");
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  if (CGRectContainsRect(v14, v15))
  {
    -[JFXTextEffectEditorView pencilTextEditingElementID](self, "pencilTextEditingElementID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v12);

  }
  else
  {
    v10[2](v10, (void *)MEMORY[0x24BDBD1A8]);
  }

}

- (void)indirectScribbleInteraction:(id)a3 focusElementIfNeeded:(id)a4 referencePoint:(CGPoint)a5 completion:(id)a6
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  void (**v12)(id, void *);

  v12 = (void (**)(id, void *))a6;
  v8 = a4;
  -[JFXTextEffectEditorView pencilTextEditingElementID](self, "pencilTextEditingElementID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    -[JFXTextEffectEditorView editField](self, "editField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v11);

  }
  else
  {
    v12[2](v12, 0);
  }

}

- (BOOL)indirectScribbleInteraction:(id)a3 isElementFocused:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[JFXTextEffectEditorView pencilTextEditingElementID](self, "pencilTextEditingElementID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

- (CGRect)indirectScribbleInteraction:(id)a3 frameForElement:(id)a4
{
  id v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  v5 = a4;
  -[JFXTextEffectEditorView pencilTextEditingElementID](self, "pencilTextEditingElementID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    -[JFXTextEffectEditorView bounds](self, "bounds");
  }
  else
  {
    v8 = *MEMORY[0x24BDBF070];
    v9 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v10 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v11 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (JFXTextEffectEditorTextView)editField
{
  return self->_editField;
}

- (void)setEditField:(id)a3
{
  objc_storeStrong((id *)&self->_editField, a3);
}

- (UIView)transformView
{
  return self->_transformView;
}

- (void)setTransformView:(id)a3
{
  objc_storeStrong((id *)&self->_transformView, a3);
}

- (JFXEffectTextEditingProperties)textEditingProperties
{
  return self->_textEditingProperties;
}

- (void)setTextEditingProperties:(id)a3
{
  objc_storeStrong((id *)&self->_textEditingProperties, a3);
}

- (NSUUID)pencilTextEditingElementID
{
  return self->_pencilTextEditingElementID;
}

- (void)setPencilTextEditingElementID:(id)a3
{
  objc_storeStrong((id *)&self->_pencilTextEditingElementID, a3);
}

- (JFXOverlayEffectDebugViewOptions)debugOptions
{
  return self->_debugOptions;
}

- (void)setDebugOptions:(id)a3
{
  objc_storeStrong((id *)&self->_debugOptions, a3);
}

- (UIView)debugView
{
  return self->_debugView;
}

- (void)setDebugView:(id)a3
{
  objc_storeStrong((id *)&self->_debugView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugView, 0);
  objc_storeStrong((id *)&self->_debugOptions, 0);
  objc_storeStrong((id *)&self->_pencilTextEditingElementID, 0);
  objc_storeStrong((id *)&self->_textEditingProperties, 0);
  objc_storeStrong((id *)&self->_transformView, 0);
  objc_storeStrong((id *)&self->_editField, 0);
}

@end
