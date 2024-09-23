@implementation CUIKMessageStringForEventInvitationNotification

void __CUIKMessageStringForEventInvitationNotification_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "statusChanged") && objc_msgSend(v9, "participantStatus") == 3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
  objc_msgSend(v9, "comment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CUIKNotificationDescriptionGenerator stringWithAutoCommentRemoved:](CUIKNotificationDescriptionGenerator, "stringWithAutoCommentRemoved:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "commentChanged") && objc_msgSend(v7, "length"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
  if (objc_msgSend(v9, "proposedStartDateChanged"))
  {
    objc_msgSend(v9, "proposedStartDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
      if (objc_msgSend(v9, "proposedStartDateDeclined"))
      {
        if (objc_msgSend(v9, "isCurrentUser"))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
          *a4 = 1;
        }
      }
    }
  }

}

@end
