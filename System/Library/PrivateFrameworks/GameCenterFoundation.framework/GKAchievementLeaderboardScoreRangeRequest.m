@implementation GKAchievementLeaderboardScoreRangeRequest

+ (id)requestForRankRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  GKAchievementLeaderboardScoreRangeRequest *v5;

  length = a3.length;
  location = a3.location;
  v5 = objc_alloc_init(GKAchievementLeaderboardScoreRangeRequest);
  -[GKLeaderboardScoreRequest setIdentifier:](v5, "setIdentifier:", CFSTR("com.apple.gamecenter.achievement.points"));
  -[GKLeaderboardScoreRequest setTimeScope:](v5, "setTimeScope:", 2);
  -[GKLeaderboardScoreRangeRequest setRange:](v5, "setRange:", location, length);
  return v5;
}

@end
