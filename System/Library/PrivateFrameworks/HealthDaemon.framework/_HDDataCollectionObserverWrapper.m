@implementation _HDDataCollectionObserverWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_destroyWeak(&self->_observer);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  id WeakRetained;
  double collectionInterval;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained(&self->_observer);
  collectionInterval = self->_collectionInterval;
  if (-[HDDataCollectionObserverState isInBackground](self->_state, "isInBackground"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[HDDataCollectionObserverState hasRunningWorkout](self->_state, "hasRunningWorkout"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> %@ (%lfs, inBackground=%@, hasRunningWorkout=%@)"), v4, self, WeakRetained, *(_QWORD *)&collectionInterval, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
