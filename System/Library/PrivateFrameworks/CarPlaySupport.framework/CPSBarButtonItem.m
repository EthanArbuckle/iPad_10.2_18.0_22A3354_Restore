@implementation CPSBarButtonItem

- (CPSBarButtonItem)initWithCPBarButton:(id)a3
{
  char isKindOfClass;
  uint64_t v4;
  CPSBarButtonItem *v5;
  CPSBarButtonItem *v7;
  id location[2];
  CPSBarButtonItem *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = 3;
  if ((isKindOfClass & 1) == 0)
    v4 = 0;
  v5 = v9;
  v9 = 0;
  v9 = -[CPSBarButtonItem initWithCPBarButton:type:](v5, "initWithCPBarButton:type:", location[0], v4);
  v7 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v7;
}

- (CPSBarButtonItem)initWithCPBarButton:(id)a3 type:(unint64_t)a4
{
  _BOOL8 v4;
  NSUUID *v5;
  NSUUID *identifier;
  char v7;
  CPSBarButtonItem *v9;
  CPSBarButtonItem *v11;
  id v12;
  id v13;
  objc_super v14;
  unint64_t v15;
  id location[2];
  CPSBarButtonItem *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = a4;
  v11 = v17;
  v13 = (id)objc_msgSend(location[0], "title");
  v12 = (id)objc_msgSend(location[0], "image");
  v4 = barButtonStyle(location[0]);
  v17 = 0;
  v14.receiver = v11;
  v14.super_class = (Class)CPSBarButtonItem;
  v17 = -[CPUIBarButtonItem initWithTitle:image:style:type:](&v14, sel_initWithTitle_image_style_type_, v13, v12, v4, a4);
  objc_storeStrong((id *)&v17, v17);

  if (v17)
  {
    v5 = (NSUUID *)(id)objc_msgSend(location[0], "identifier");
    identifier = v17->_identifier;
    v17->_identifier = v5;

    objc_storeStrong((id *)&v17->_barButton, location[0]);
    -[CPUIBarButtonItem setCpui_delegate:](v17, "setCpui_delegate:", v17);
    v7 = objc_msgSend(location[0], "isEnabled");
    -[CPUIBarButtonItem setEnabled:](v17, "setEnabled:", v7 & 1);
  }
  v9 = v17;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v9;
}

- (void)didSelectButton:(id)a3 withInteractionModel:(unint64_t)a4
{
  CPBarButton *v4;
  CPSButtonDelegate *v5;
  CPSUtilities *v7;
  CPSButtonDelegate *v8;
  char v9;
  id location[2];
  CPSBarButtonItem *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = +[CPSUtilities sharedInstance](CPSUtilities, "sharedInstance");
  -[CPSUtilities setLastButtonPressInteractionModel:](v7, "setLastButtonPressInteractionModel:", a4);

  v8 = -[CPSBarButtonItem delegate](v11, "delegate");
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v5 = -[CPSBarButtonItem delegate](v11, "delegate");
    v4 = -[CPSBarButtonItem barButton](v11, "barButton");
    -[CPSButtonDelegate didSelectButton:](v5, "didSelectButton:");

  }
  objc_storeStrong(location, 0);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (CPBarButton)barButton
{
  return self->_barButton;
}

- (CPSButtonDelegate)delegate
{
  return (CPSButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_barButton, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
