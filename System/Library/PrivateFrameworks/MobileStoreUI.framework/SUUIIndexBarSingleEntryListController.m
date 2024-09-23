@implementation SUUIIndexBarSingleEntryListController

- (SUUIIndexBarSingleEntryListController)initWithEntryViewElement:(id)a3
{
  id v5;
  SUUIIndexBarSingleEntryListController *v6;
  SUUIIndexBarSingleEntryListController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIIndexBarSingleEntryListController;
  v6 = -[SUUIIndexBarSingleEntryListController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_entryViewElement, a3);

  return v7;
}

- (id)entryDescriptorAtIndex:(int64_t)a3
{
  return self->_entryDescriptor;
}

- (BOOL)hidesIndexBar
{
  return 0;
}

- (BOOL)needsRootTargetViewElement
{
  return 0;
}

- (int64_t)numberOfEntryDescriptors
{
  return self->_entryDescriptor != 0;
}

- (void)reloadViewElementData
{
  SUUIViewElement *v3;
  SUUIViewElement *descriptiveViewElement;
  SUUIIndexBarEntryDescriptor *v5;
  SUUIIndexBarEntryDescriptor *entryDescriptor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIIndexBarSingleEntryListController;
  -[SUUIIndexBarEntryListController reloadViewElementData](&v7, sel_reloadViewElementData);
  -[SUUIIndexBarEntryViewElement childElement](self->_entryViewElement, "childElement");
  v3 = (SUUIViewElement *)objc_claimAutoreleasedReturnValue();
  descriptiveViewElement = self->_descriptiveViewElement;
  if (descriptiveViewElement != v3 && (-[SUUIViewElement isEqual:](descriptiveViewElement, "isEqual:", v3) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_descriptiveViewElement, v3);
    -[SUUIIndexBarEntryListController _didInvalidate](self, "_didInvalidate");
  }
  SUUIIndexBarEntryDescriptorForIndexBarEntryViewElement(self->_entryViewElement, self->_descriptiveViewElement);
  v5 = (SUUIIndexBarEntryDescriptor *)objc_claimAutoreleasedReturnValue();
  entryDescriptor = self->_entryDescriptor;
  if (entryDescriptor != v5 && !-[SUUIIndexBarEntryDescriptor isEqual:](entryDescriptor, "isEqual:", v5))
  {
    objc_storeStrong((id *)&self->_entryDescriptor, v5);
    -[SUUIIndexBarEntryListController _didInvalidate](self, "_didInvalidate");
  }

}

- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4
{
  if (a4)
    *a4 = 0;
  return -[SUUIIndexBarEntryViewElement targetIndexBarEntryID](self->_entryViewElement, "targetIndexBarEntryID", a3);
}

- (SUUIIndexBarEntryViewElement)entryViewElement
{
  return self->_entryViewElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryViewElement, 0);
  objc_storeStrong((id *)&self->_descriptiveViewElement, 0);
  objc_storeStrong((id *)&self->_entryDescriptor, 0);
}

@end
