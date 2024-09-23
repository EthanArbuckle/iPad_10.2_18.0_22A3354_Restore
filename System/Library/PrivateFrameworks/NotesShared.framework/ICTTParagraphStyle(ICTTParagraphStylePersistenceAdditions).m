@implementation ICTTParagraphStyle(ICTTParagraphStylePersistenceAdditions)

- (void)initWithData:()ICTTParagraphStylePersistenceAdditions .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "ICTTParagraphStyle protobuf corrupt.", v1, 2u);
}

- (void)saveToArchive:()ICTTParagraphStylePersistenceAdditions .cold.1()
{
  __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
}

- (void)saveToArchive:()ICTTParagraphStylePersistenceAdditions .cold.2()
{
  __assert_rtn("set_writingdirection", "topotext.pb.h", 4826, "::topotext::AttributeRun_WritingDirection_IsValid(value)");
}

- (void)saveToArchive:()ICTTParagraphStylePersistenceAdditions .cold.3()
{
  __assert_rtn("set_alignment", "topotext.pb.h", 4801, "::topotext::ParagraphStyle_Alignment_IsValid(value)");
}

@end
