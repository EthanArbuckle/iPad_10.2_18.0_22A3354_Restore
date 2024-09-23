@implementation HDUnitPreferencesSyncEntity

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (int64_t)category
{
  return 104;
}

+ (int)nanoSyncObjectType
{
  return 9;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 10);
}

+ (void)didReceiveValuesForKeys:(id)a3 profile:(id)a4
{
  void *v4;
  void *v5;
  os_unfair_lock_s *v6;
  _QWORD v7[5];

  objc_msgSend(a4, "unitPreferencesManager", a3);
  v6 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    os_unfair_lock_lock(v6 + 8);
    v4 = *(void **)&v6[4]._os_unfair_lock_opaque;
    *(_QWORD *)&v6[4]._os_unfair_lock_opaque = 0;

    v5 = *(void **)&v6[6]._os_unfair_lock_opaque;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__HDUnitPreferencesManager__lock_notifyObserversWithUnitPreferences__block_invoke;
    v7[3] = &unk_1E6CF22A8;
    v7[4] = v6;
    objc_msgSend(v5, "notifyObservers:", v7);
    os_unfair_lock_unlock(v6 + 8);
  }

}

@end
