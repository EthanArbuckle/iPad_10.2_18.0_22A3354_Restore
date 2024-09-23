@implementation GKCancelSwipeToEditGestureRecognizer

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        if (-[GKCollectionViewCell touchWithinEditActions:](self->_currentEditingCell, "touchWithinEditActions:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i)))
        {
          -[GKCancelSwipeToEditGestureRecognizer setState:](self, "setState:", 5);
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  v13.receiver = self;
  v13.super_class = (Class)GKCancelSwipeToEditGestureRecognizer;
  -[GKCancelSwipeToEditGestureRecognizer touchesEnded:withEvent:](&v13, sel_touchesEnded_withEvent_, v8, v7);

}

- (GKCollectionViewCell)currentEditingCell
{
  return self->_currentEditingCell;
}

- (void)setCurrentEditingCell:(id)a3
{
  objc_storeStrong((id *)&self->_currentEditingCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentEditingCell, 0);
}

@end
