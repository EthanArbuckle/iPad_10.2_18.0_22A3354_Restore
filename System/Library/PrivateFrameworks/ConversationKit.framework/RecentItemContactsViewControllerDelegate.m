@implementation RecentItemContactsViewControllerDelegate

- (void)contactViewController:(id)a3 didExecuteBlockAndReportContactAction:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit40RecentItemContactsViewControllerDelegate *v8;
  CNContact_optional v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  RecentItemContactsViewControllerDelegate.contactViewController(_:didExecuteBlockAndReportContactAction:)((CNContactViewController_optional *)v8, v9);

}

- (_TtC15ConversationKit40RecentItemContactsViewControllerDelegate)init
{
  RecentItemContactsViewControllerDelegate.init()();
}

- (void).cxx_destruct
{
  outlined destroy of RecentsCallItem((uint64_t)self + OBJC_IVAR____TtC15ConversationKit40RecentItemContactsViewControllerDelegate_callItemToBlock, type metadata accessor for RecentsCallItem);
  swift_release();
}

@end
