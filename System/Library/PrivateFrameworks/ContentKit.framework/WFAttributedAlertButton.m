@implementation WFAttributedAlertButton

+ (id)buttonWithAttributedTitle:(id)a3 label:(id)a4 selected:(BOOL)a5 style:(int64_t)a6 handler:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  objc_msgSend(a1, "buttonWithTitle:subtitle:selected:style:handler:", v13, 0, v9, a6, a7);
  v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    v16 = (void *)v14[10];
    v14[10] = v15;

    v17 = objc_msgSend(v13, "copy");
    v18 = (void *)v14[11];
    v14[11] = v17;

    v19 = v14;
  }

  return v14;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
}

@end
