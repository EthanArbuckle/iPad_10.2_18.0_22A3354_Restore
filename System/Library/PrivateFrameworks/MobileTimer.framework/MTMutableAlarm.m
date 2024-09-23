@implementation MTMutableAlarm

- (id)copyWithZone:(_NSZone *)a3
{
  MTAlarm *v4;
  void *v5;
  MTAlarm *v6;

  v4 = +[MTAlarm allocWithZone:](MTAlarm, "allocWithZone:", a3);
  -[MTAlarm alarmID](self, "alarmID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MTAlarm initWithIdentifier:](v4, "initWithIdentifier:", v5);

  -[MTAlarm _copyStateOntoAlarm:](self, "_copyStateOntoAlarm:", v6);
  return v6;
}

- (void)applyChangesFromChangeSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  +[MTChangeSet changeSetWithChangesFromObject:toObject:](MTChangeSet, "changeSetWithChangesFromObject:toObject:", 0, self);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changeSetByAddingChangeSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_deserializer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTAlarm _updatePropertiesFromDeserializer:](self, "_updatePropertiesFromDeserializer:", v6);

}

@end
