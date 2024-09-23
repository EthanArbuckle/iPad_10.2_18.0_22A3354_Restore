@implementation _UIDocumentSearchListController

- (Class)_classForChildren
{
  return (Class)objc_opt_class();
}

- (_UIDocumentSearchListController)init
{
  _UIDocumentPickerSearchContainerModel *v3;
  void *v4;
  _UIDocumentPickerSearchContainerModel *v5;
  _UIDocumentSearchListController *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = [_UIDocumentPickerSearchContainerModel alloc];
  v8[0] = *MEMORY[0x24BDC17B8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIDocumentPickerSearchContainerModel initWithPickableTypes:mode:](v3, "initWithPickableTypes:mode:", v4, 1);

  v6 = -[_UIDocumentSearchListController initWithModel:](self, "initWithModel:", v5);
  return v6;
}

- (_UIDocumentSearchListController)initWithModel:(id)a3
{
  id v5;
  _UIDocumentSearchListController *v6;
  _UIDocumentSearchListController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentSearchListController;
  v6 = -[_UIDocumentListController initWithModel:](&v9, sel_initWithModel_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    -[_UIDocumentSearchListController setRestorationIdentifier:](v7, "setRestorationIdentifier:", 0);
  }

  return v7;
}

- (void)setQueryString:(id)a3
{
  -[_UIDocumentPickerSearchContainerModel setQueryString:](self->_model, "setQueryString:", a3);
}

- (NSString)queryString
{
  return -[_UIDocumentPickerSearchContainerModel queryString](self->_model, "queryString");
}

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  return 0;
}

- (BOOL)hideSearchField
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

@end
