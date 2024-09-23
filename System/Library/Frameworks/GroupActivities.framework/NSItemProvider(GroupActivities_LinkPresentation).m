@implementation NSItemProvider(GroupActivities_LinkPresentation)

- (void)registerTUConversationActivityMetadata:()GroupActivities_LinkPresentation
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = *(void **)CUTWeakLinkSymbol();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__NSItemProvider_GroupActivities_LinkPresentation__registerTUConversationActivityMetadata___block_invoke;
  v8[3] = &unk_1E44FABA0;
  v9 = v4;
  v6 = v4;
  v7 = v5;
  objc_msgSend(a1, "registerItemForTypeIdentifier:loadHandler:", v7, v8);

}

@end
