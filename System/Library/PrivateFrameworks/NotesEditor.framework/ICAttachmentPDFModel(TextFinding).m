@implementation ICAttachmentPDFModel(TextFinding)

- (void)textFindingResultsMatchingString:()TextFinding textView:ignoreCase:wholeWords:startsWith:usePattern:completion:
{
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;

  v16 = a9;
  v17 = a4;
  v18 = a3;
  objc_msgSend(a1, "attachment");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = a8;
  +[ICPDFTextFindingResult resultsInAttachment:matchingString:textView:ignoreCase:wholeWords:startsWith:usePattern:completion:](_TtC11NotesEditor22ICPDFTextFindingResult, "resultsInAttachment:matchingString:textView:ignoreCase:wholeWords:startsWith:usePattern:completion:", v20, v18, v17, a5, a6, a7, v19, v16);

}

@end
