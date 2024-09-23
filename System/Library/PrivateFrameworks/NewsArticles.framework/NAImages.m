@implementation NAImages

+ (UIImage)iconTextSizeControl
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, qword_1ED598000, (id *)&qword_1ED597B50);
}

+ (UIImage)iconTextSizeControlCompact
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, &qword_1ED590688, (id *)&qword_1ED58FFC0);
}

+ (UIImage)iconTextSizeControlLarger
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, &qword_1EF24EB70, (id *)&qword_1EF25C130);
}

+ (UIImage)iconTextSizeControlSmaller
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, &qword_1EF24EB78, (id *)&qword_1EF25C138);
}

+ (UIImage)moreActions
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, &qword_1ED5907F0, (id *)&qword_1ED5907E0);
}

+ (UIImage)sharrow
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, &qword_1ED598798, (id *)&qword_1ED597B58);
}

+ (UIImage)sharrowCompact
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, &qword_1ED590670, (id *)&qword_1ED58FFB8);
}

+ (UIImage)rightArrow
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, &qword_1ED598788, (id *)&qword_1ED597B48);
}

+ (UIImage)leftArrow
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, &qword_1ED598010, (id *)&qword_1ED597B60);
}

+ (UIImage)upArrow
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, &qword_1EF24EB88, (id *)&qword_1EF25C140);
}

+ (UIImage)downArrow
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, &qword_1EF24EB90, (id *)&qword_1EF25C148);
}

+ (UIImage)playing
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, qword_1EF24EB98, (id *)&qword_1EF25C150);
}

+ (UIImage)play
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, qword_1ED590050, (id *)&qword_1ED58FFC8);
}

+ (UIImage)playNext
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, &qword_1ED590698, (id *)&qword_1ED58FFD8);
}

+ (UIImage)playLast
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, &qword_1ED590690, (id *)&qword_1ED58FFD0);
}

+ (UIImage)readStory
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, &qword_1EF24EBA8, (id *)&qword_1EF25C158);
}

+ (UIImage)remove
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, &qword_1EF24EBB0, (id *)&qword_1EF25C160);
}

+ (UIImage)reload
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, &qword_1EF24EBB8, (id *)&qword_1EF25C168);
}

+ (UIImage)copyLinkActivity
{
  if (qword_1EF24EBC0 != -1)
    swift_once();
  return (UIImage *)(id)qword_1EF25C170;
}

+ (UIImage)reportActivity
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, &qword_1ED590048, (id *)&qword_1ED58FFB0);
}

+ (UIImage)openInSafariActivity
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, qword_1EF24EBD0, (id *)&qword_1EF25C178);
}

+ (UIImage)iconArticleMarkingShare
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, qword_1ED590678, (id *)&qword_1ED58FF68);
}

+ (UIImage)openChannelActivity
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, &qword_1EF24EBE0, (id *)&qword_1EF25C180);
}

+ (UIImage)removeIssueActivity
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, &qword_1EF24EBE8, (id *)&qword_1EF25C188);
}

+ (UIImage)downloadIssueActivity
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, &qword_1EF24EBF0, (id *)&qword_1EF25C190);
}

+ (UIImage)removeIssueFromMyMagazinesActivity
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, &qword_1EF24EBF8, (id *)&qword_1EF25C198);
}

+ (UIImage)iconConcernSelect
{
  return (UIImage *)sub_1BA09B90C((uint64_t)a1, (uint64_t)a2, &qword_1EF24EC18, (id *)&qword_1EF25C1A0);
}

- (NAImages)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Images();
  return -[NAImages init](&v3, sel_init);
}

@end
