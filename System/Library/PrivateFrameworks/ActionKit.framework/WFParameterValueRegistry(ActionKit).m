@implementation WFParameterValueRegistry(ActionKit)

+ (id)allParameterValueClassesInActionKit
{
  _QWORD v1[13];

  v1[12] = *MEMORY[0x24BDAC8D0];
  v1[0] = +[WFPHAssetCollectionState processingValueClass](WFPHAssetCollectionState, "processingValueClass");
  v1[1] = +[WFNSUnitSubstitutableState processingValueClass](WFNSUnitSubstitutableState, "processingValueClass");
  v1[2] = +[WFPlaylistSubstitutableState processingValueClass](WFPlaylistSubstitutableState, "processingValueClass");
  v1[3] = +[WFTrelloBoardSubstitutableState processingValueClass](WFTrelloBoardSubstitutableState, "processingValueClass");
  v1[4] = +[WFTrelloListSubstitutableState processingValueClass](WFTrelloListSubstitutableState, "processingValueClass");
  v1[5] = +[WFTrelloBoardSubstitutableState processingValueClass](WFTrelloBoardSubstitutableState, "processingValueClass");
  v1[6] = +[WFMediaRouteState processingValueClass](WFMediaRouteState, "processingValueClass");
  v1[7] = +[WFTumblrBlogSubstitutableState processingValueClass](WFTumblrBlogSubstitutableState, "processingValueClass");
  v1[8] = +[WFFIUIWorkoutActivityTypeSubstitutableState processingValueClass](WFFIUIWorkoutActivityTypeSubstitutableState, "processingValueClass");
  v1[9] = +[WFSSHKeyParameterState processingValueClass](WFSSHKeyParameterState, "processingValueClass");
  v1[10] = +[WFLinkDynamicOptionSubstitutableState processingValueClass](WFNoteGroupSubstituableState, "processingValueClass");
  v1[11] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 12);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
