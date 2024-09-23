@implementation MessageListSectionDataSourceConfiguration

- (MessageListViewControllerState)state
{
  return self->_state;
}

- (MessageListSectionDataSourceSelectionModelProvider)selectionModelProvider
{
  return (MessageListSectionDataSourceSelectionModelProvider *)objc_loadWeakRetained((id *)&self->_selectionModelProvider);
}

- (NSString)section
{
  return self->_section;
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (MessageListCellLayoutValuesHelper)layoutValuesHelper
{
  return self->_layoutValuesHelper;
}

- (EFPromise)initialLoadCompletedPromise
{
  return self->_initialLoadCompletedPromise;
}

- (EMObjectID)identifier
{
  return self->_identifier;
}

- (MessageListSectionDataSourceDelegate)delegate
{
  return (MessageListSectionDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchProgressView, 0);
  objc_destroyWeak((id *)&self->_selectionModelProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_layoutValuesHelper, 0);
  objc_storeStrong((id *)&self->_initialLoadCompletedPromise, 0);
  objc_storeStrong((id *)&self->_messageList, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (MessageListSectionDataSourceConfiguration)initWithIdentifier:(id)a3 section:(id)a4 collectionView:(id)a5 messageList:(id)a6 layoutValuesHelper:(id)a7 state:(id)a8 delegate:(id)a9 selectionModelProvider:(id)a10 initialLoadCompletedPromise:(id)a11 searchProgressView:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  MessageListSectionDataSourceConfiguration *v22;
  MessageListSectionDataSourceConfiguration *v23;
  id obj;
  id v26;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v33 = a3;
  v32 = a4;
  obj = a5;
  v31 = a5;
  v30 = a6;
  v26 = a7;
  v29 = a7;
  v28 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v34.receiver = self;
  v34.super_class = (Class)MessageListSectionDataSourceConfiguration;
  v22 = -[MessageListSectionDataSourceConfiguration init](&v34, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_identifier, a3);
    objc_storeStrong((id *)&v23->_section, a4);
    objc_storeStrong((id *)&v23->_collectionView, obj);
    objc_storeStrong((id *)&v23->_messageList, a6);
    objc_storeStrong((id *)&v23->_layoutValuesHelper, v26);
    objc_storeStrong((id *)&v23->_state, a8);
    objc_storeWeak((id *)&v23->_delegate, v18);
    objc_storeWeak((id *)&v23->_selectionModelProvider, v19);
    objc_storeStrong((id *)&v23->_initialLoadCompletedPromise, a11);
    objc_storeStrong((id *)&v23->_searchProgressView, a12);
  }

  return v23;
}

- (MFSearchProgressView)searchProgressView
{
  return self->_searchProgressView;
}

- (void)setSearchProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_searchProgressView, a3);
}

@end
