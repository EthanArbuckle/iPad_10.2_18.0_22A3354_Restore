@implementation NSUndoManager(ITK)

- (uint64_t)itk_isUndoingOrRedoing
{
  if ((objc_msgSend(a1, "isUndoing") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "isRedoing");
}

- (uint64_t)itk_performUndoGroup:()ITK
{
  return objc_msgSend(a1, "itk_performUndoGroupWithActionName:undoGroup:", 0, a3);
}

- (void)itk_performUndoGroupWithActionName:()ITK undoGroup:
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "groupsByEvent");
  objc_msgSend(a1, "setGroupsByEvent:", 0);
  objc_msgSend(a1, "beginUndoGrouping");
  v7[2](v7);

  if (objc_msgSend(v6, "length"))
    objc_msgSend(a1, "setActionName:", v6);
  if (objc_msgSend(a1, "groupingLevel"))
  {
    objc_msgSend(a1, "endUndoGrouping");
  }
  else
  {
    v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[NSUndoManager(ITK) itk_performUndoGroupWithActionName:undoGroup:].cold.1(v9);

  }
  objc_msgSend(a1, "setGroupsByEvent:", v8);

}

- (void)itk_performUndoGroupWithActionName:()ITK undoGroup:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23F0CB000, log, OS_LOG_TYPE_ERROR, "Attempted to endUndoGrouping for a non-0 groupingLevel undoManager", v1, 2u);
}

@end
