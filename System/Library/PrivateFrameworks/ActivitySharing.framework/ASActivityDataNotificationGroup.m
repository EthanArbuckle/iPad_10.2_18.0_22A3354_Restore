@implementation ASActivityDataNotificationGroup

- (unint64_t)notificationCount
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSSet count](self->_goalCompletionNotifications, "count");
  v4 = -[NSSet count](self->_workoutNotifications, "count") + v3;
  return v4 + -[NSSet count](self->_achievementNotifications, "count");
}

- (NSSet)allNotifications
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_goalCompletionNotifications)
  {
    objc_msgSend(v3, "setByAddingObjectsFromSet:");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  if (self->_workoutNotifications)
  {
    objc_msgSend(v4, "setByAddingObjectsFromSet:");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  if (self->_achievementNotifications)
  {
    objc_msgSend(v4, "setByAddingObjectsFromSet:");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  return (NSSet *)v4;
}

- (NSSet)goalCompletionNotifications
{
  return self->_goalCompletionNotifications;
}

- (void)setGoalCompletionNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_goalCompletionNotifications, a3);
}

- (NSSet)achievementNotifications
{
  return self->_achievementNotifications;
}

- (void)setAchievementNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_achievementNotifications, a3);
}

- (NSSet)workoutNotifications
{
  return self->_workoutNotifications;
}

- (void)setWorkoutNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_workoutNotifications, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutNotifications, 0);
  objc_storeStrong((id *)&self->_achievementNotifications, 0);
  objc_storeStrong((id *)&self->_goalCompletionNotifications, 0);
}

@end
