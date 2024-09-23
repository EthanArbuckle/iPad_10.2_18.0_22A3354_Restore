@implementation NEImages

+ (UIImage)headphones
{
  return (UIImage *)sub_1BA91F05C((uint64_t)a1, (uint64_t)a2, &qword_1ED39E208, (id *)&qword_1ED39D8E0);
}

+ (UIImage)stopSuggesting
{
  return (UIImage *)sub_1BA91F05C((uint64_t)a1, (uint64_t)a2, qword_1ED3ABB78, (id *)&qword_1ED39E270);
}

+ (UIImage)followChannelActivity
{
  return (UIImage *)sub_1BA91F05C((uint64_t)a1, (uint64_t)a2, &qword_1ED3AAB30, (id *)&qword_1ED39D910);
}

+ (UIImage)unfollowChannelActivity
{
  return (UIImage *)sub_1BA91F05C((uint64_t)a1, (uint64_t)a2, &qword_1EF2A7228, (id *)&qword_1ED39D918);
}

+ (UIImage)unfollowChannelActivity2
{
  return (UIImage *)sub_1BA91F05C((uint64_t)a1, (uint64_t)a2, &qword_1EF2A7230, (id *)&qword_1EF2C4720);
}

+ (UIImage)shortcutTagActivity
{
  return (UIImage *)sub_1BA91F05C((uint64_t)a1, (uint64_t)a2, &qword_1EF2A7238, (id *)&qword_1EF2C4728);
}

+ (UIImage)unShortcutTagActivity
{
  return (UIImage *)sub_1BA91F05C((uint64_t)a1, (uint64_t)a2, &qword_1EF2A7240, (id *)&qword_1EF2C4730);
}

+ (UIImage)blockActivity
{
  return (UIImage *)sub_1BA91F05C((uint64_t)a1, (uint64_t)a2, &qword_1ED3AAB28, (id *)&qword_1ED39D8E8);
}

+ (UIImage)unblockActivity
{
  return (UIImage *)sub_1BA91F05C((uint64_t)a1, (uint64_t)a2, &qword_1EF2A7250, (id *)&qword_1EF2C4738);
}

+ (UIImage)showMoreActivity
{
  return (UIImage *)sub_1BA91F05C((uint64_t)a1, (uint64_t)a2, &qword_1ED39E9D8, (id *)&qword_1ED39BD78);
}

+ (UIImage)showMoreSelectedActivity
{
  return (UIImage *)sub_1BA91F05C((uint64_t)a1, (uint64_t)a2, &qword_1ED39E9F0, (id *)&qword_1ED39BD80);
}

+ (UIImage)showLessActivity
{
  return (UIImage *)sub_1BA91F05C((uint64_t)a1, (uint64_t)a2, &qword_1ED39E9C8, (id *)&qword_1ED39D8F8);
}

+ (UIImage)showLessSelectedActivity
{
  return (UIImage *)sub_1BA91F05C((uint64_t)a1, (uint64_t)a2, &qword_1ED39E9E0, (id *)&qword_1ED39D920);
}

+ (UIImage)saveActivity
{
  return (UIImage *)sub_1BA91F05C((uint64_t)a1, (uint64_t)a2, &qword_1ED3BB478, (id *)&qword_1ED3B02E8);
}

+ (UIImage)saveSelectedActivity
{
  return (UIImage *)sub_1BA91F05C((uint64_t)a1, (uint64_t)a2, &qword_1EF2A7260, (id *)&qword_1EF2C4740);
}

+ (UIImage)reload
{
  return (UIImage *)sub_1BA91F05C((uint64_t)a1, (uint64_t)a2, &qword_1EF2A7268, (id *)&qword_1EF2C4748);
}

+ (UIImage)actionSheetStopSuggesting
{
  return (UIImage *)sub_1BA91F05C((uint64_t)a1, (uint64_t)a2, &qword_1ED3ABB90, (id *)qword_1ED39E278);
}

+ (UIImage)actionSheetBlock
{
  return (UIImage *)sub_1BA91F05C((uint64_t)a1, (uint64_t)a2, &qword_1ED3ABB88, (id *)&qword_1ED39D8F0);
}

+ (UIImage)actionSheetUnblock
{
  return (UIImage *)sub_1BA91F05C((uint64_t)a1, (uint64_t)a2, &qword_1EF2A7310, (id *)&qword_1EF2C47D8);
}

+ (UIImage)actionSheetFollow
{
  return (UIImage *)sub_1BA91F05C((uint64_t)a1, (uint64_t)a2, &qword_1EF2A7318, (id *)&qword_1ED39D900);
}

+ (UIImage)actionSheetUnfollow
{
  return (UIImage *)sub_1BA91F05C((uint64_t)a1, (uint64_t)a2, &qword_1EF2A7320, (id *)&qword_1ED39D908);
}

- (NEImages)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Images();
  return -[NEImages init](&v3, sel_init);
}

@end
